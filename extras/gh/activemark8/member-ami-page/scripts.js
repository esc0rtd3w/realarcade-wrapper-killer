(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
function ContactpageController ($scope, $rootScope, $modal, userSvc) {
    // Set header
    $rootScope.showNormalNav = true;

    $scope.submissionHadError = false;
    $scope.ticket = {};
    $scope.showLoader = false;

    /*
     * function that gathers information about the user's system
     * this function is adapted from the one in our other Zendesk instances
     */
    function systemInformation() {
        var result = "";
        try {
            result = "User Agent: " + navigator.userAgent +"\n";
            result += "screen width: " + window.screen.width +  "px\n";
            result += "screen height: " + window.screen.height + "px\n";
            result += "screen depth: " + window.screen.pixelDepth + "bits\n";
        } catch (e) {
            result = "Something went wrong while retrieving the user's system information. Error:" + e.message;
        } finally {
            return result;
        }
    }
    /*
     * function that gathers information about the player
     */
    function playerInformation() {
        var result = "";
        try {
            result = "playerId: " + $rootScope.player.userId +"\n";
            result += "email: " + $rootScope.player.email + "\n";
            result += "isEntitled: " + $rootScope.player.isEntitled + "\n";
            result += "deviceId: " + $rootScope.deviceId + "\n";
        } catch (e) {
            result = "Something went wrong while retrieving the player information. Error:" + e.message;
        } finally {
            return result;
        }
    }

    // Determine if we have any user information.
    // If not, retrieve it
    userSvc.getPlayer().then(function(response){
        if(!response.data){
            gatheringSvc.sendErrorInfo('GetPlayer', ' Error: failed getting player data / ' + response.error);
        } else {
            if (!!response.data && !!response.data.isLoggedIn) {
                $scope.ticket.email = response.data.email;
                if (response.data.playerName) {
                    $scope.ticket.userName = response.data.playerName;
                }
            }
        }
    });

    $scope.submitTicket = function() {
        // reset any error messages upon submitting a new ticket
        $scope.submissionHadError = false;
        // check for Angular validation
        if ($scope.contactForm.$valid) {
            $scope.showLoader = true;
            userSvc.postZendeskTicket($scope.ticket.email, $scope.ticket.userName, $scope.ticket.topic,
                $scope.ticket.comment, $scope.ticket.gameName,
                systemInformation(), playerInformation())
                .success(function(data) {
                    if (data && data.status === 'SUCCESS') {
                        openSuccessModal();
                        $scope.showLoader = false;
                    } else {
                        $scope.submissionHadError = true;
                        $scope.showLoader = false;
                    }
                }).error(function(data) {
                    $scope.submissionHadError = true;
                    $scope.showLoader = false;
                }
            );
        }
    };

    function openSuccessModal() {
        $rootScope.currentModal = $modal.open({
            templateUrl: 'successfulTicketSubmission.html',
            size: 'md',
            backdrop: 'static',
            keyboard: false
        });
    }
}


ContactpageController.$inject = ['$scope', '$rootScope', '$modal', 'userSvc'];
module.exports = ContactpageController;
},{}],2:[function(require,module,exports){
function FaqpageController ($rootScope, $scope, $analytics, faqService) {
    $analytics.pageTrack('/member/#/help');
    $scope.faqContent = {};

    faqService.getAllQuestionCategories().success(function(questions){
        if (questions !== null) {
            var categories = {};
            for (var i = 0; i < questions.length; i++) {
                var articles = {};
                for (var x = 0; x < questions[i].articles.length; x++) {
                    articles[x] = questions[i].articles[x];
                    // add nicely-formatted ID for QA purposes
                    articles[x].seoName = articles[x].functionalId.replace("gh.faq.","");
                }
                categories[i] = {
                    name: questions[i].name,
                    articles: articles
                };
            }
            $scope.faqContent.categories = categories;
        }
    });
}


FaqpageController.$inject = ['$rootScope', '$scope', '$analytics', 'faqService'];
module.exports = FaqpageController;
},{}],3:[function(require,module,exports){
function GamepageController ($rootScope, $scope, $routeParams, gameDataSvc, $analytics, gatheringSvc, amiSvc, $window) {
    // Set header
    $rootScope.showNormalNav = true;

    var seoName = $routeParams.seoName;
    $scope.videoPlayTracked = false;
    // variables concerning rating
    $scope.hasPlayerRating = false;
    $scope.convertedPlayerRating = null;
    $scope.showMessage = [];
    $scope.showMessage.thanksForRating = false;
    $scope.showMessage.ratingWarning = false;

    $analytics.pageTrack('/games/' + seoName);

    gameDataSvc.getSpecificGame(seoName).success(function(data){
        if (data && data.contentId && data.id) {
            $scope.game = data;
            if ($scope.game != null) {
                if ($scope.game.contentId !== null && $rootScope.player.preloadingEnabled && $scope.game.preloading) {
                    amiSvc.startGamePreload($scope.game);
                }

                if ($scope.game.rating != null) {
                    if ($scope.game.rating.playerRating == null) {
                        $scope.game.rating.playerRating = 0;
                    }
                    $scope.game.rating.hasPlayerRating = ($scope.game.rating.playerRating > 0);
                    $scope.game.rating.convertedPlayerRating = Math.ceil($scope.game.rating.playerRating / 2);
                }

                // populate the game-based recommendation
                getGameBasedRecommendation($scope.game.id, $rootScope.recommendedGameLimit);
            }
        } else {
            gatheringSvc.sendErrorInfo('GetGamePageSpecificGame1', ' Error: failed getting game page specific game info. FunctionalId: ' + seoName);
            $window.location.href = '/member/#/';
        }
    }).error(function(data){
        gatheringSvc.sendErrorInfo('GetGamePageSpecificGame2', ' Error: failed getting game page specific game info. FunctionalId: ' + seoName);
        $window.location.href = '/member/#/';
    });


    $scope.postGameRating = function(gameId, ratingObject) {
        if (ratingObject != null && gameId != null) {
            ratingObject.playerRating = ratingObject.convertedPlayerRating * 2;

            gameDataSvc.postGameRating(gameId, ratingObject).success(function (data) {
                if (data != null && !data.error && data.averageRating != null && data.ratingCount != null && data.playerRating != null) {
                    $scope.hasPlayerRating = true;
                    $scope.game.rating.averageRating = data.averageRating;
                    $scope.game.rating.ratingCount = data.ratingCount;
                    $scope.game.rating.playerRating = data.playerRating;
                    $scope.game.rating.convertedPlayerRating = Math.ceil($scope.game.rating.playerRating / 2);
                    $scope.showMessage.ratingWarning = false;
                    $scope.showMessage.thanksForRating = true;
                } else {
                    $scope.showMessage.thanksForRating = false;
                    $scope.showMessage.ratingWarning = true;
                }
            }).error(function (data, status) {
                $scope.showMessage.thanksForRating = false;
                $scope.showMessage.ratingWarning = true;
            });
        } else {
            $scope.showMessage.thanksForRating = false;
            $scope.showMessage.ratingWarning = true;
        }
    };


    function getGameBasedRecommendation(gameId, numberOfGames) {
        gameDataSvc.getGameBasedRecommendations(gameId, numberOfGames).success(function (recommendedGameBasedGames) {
            if (!recommendedGameBasedGames.error) {
                $scope.recommendedGameBased = recommendedGameBasedGames.gameList;
                $rootScope.categoryCounter['recommendedGameBased-' + seoName] = $scope.recommendedGameBased.length;

                if (recommendedGameBasedGames.total > $rootScope.recommendedGameLimit) {
                    $rootScope.showLoadMore['recommendedGameBased'] = true;
                }
            } else {
                gatheringSvc.sendErrorInfo('GetGamePageRecommendedGame1', ' Error: failed getting game page recommended games. Reason: ' + recommendedGameBasedGames.error);
            }
        }).error(function (data) {
            gatheringSvc.sendErrorInfo('GetGamePageRecommendedGame2', ' Error: failed getting game page recommended games. Reason: ' + recommendedGameBasedGames.error);
        });
    }
    
    $scope.$on('$viewContentLoaded', function(event) {     
        setInterval(function(){
            var videoElement = document.getElementsByTagName('video')[0];
            if(videoElement){
                if (videoElement.paused !== 'undefined' && !$scope.videoPlayTracked){
                    $scope.videoPlayTracked = true;
                    $analytics.eventTrack('click', {  category: 'Gamepage', label: 'ClickPlayVideo' });
                }
            }
        },2000);
    });
    
    $scope.$on("$destroy", function(){
        // stop preloading of the game when we leave this page
        amiSvc.stopAllGamePreloads();
        gameDataSvc.cancelRequest();
    });
    
    window.scrollTo(0, 0);
}



GamepageController.$inject = ['$rootScope', '$scope', '$routeParams', 'gameDataSvc', '$analytics', 'gatheringSvc', 'amiSvc', '$window'];
module.exports = GamepageController;
},{}],4:[function(require,module,exports){
function GenrepageController ($rootScope, $scope, $routeParams, $location, gameDataSvc, genreService, $analytics) {
    $analytics.pageTrack('/genre/' + $routeParams.functionalId);

    // Set header
    $rootScope.showNormalNav = true;

    var setCurrentGenre = function (genreDetails) {
        $scope.genreDetails = genreDetails;

        // Retrieve the currently open Genre Identifier from the array
        // Set the full genre as the current one.
        $scope.currentGenre = $scope.genreDetails.reduce(function (memory, genre) {
            if (memory) {
                    return memory;
                }
                else {
                    if (genre.functionalId === $routeParams.functionalId) {
                        return genre;
                    }
                }
                return null;
            }, null);
        };


        genreService.getGenreDetails().then(setCurrentGenre);

            
            
        // TODO: the call should ask for "all" games, but fakes this by asking for 1000 games
        gameDataSvc.getCategoryGames($routeParams.functionalId,0,1000).success(function(allGamesInCategory){
            if(!allGamesInCategory.error) {
                $scope.allGamesInCategory = allGamesInCategory.gameList;
            // check whether we actually have any games in this category
            if ($scope.allGamesInCategory.length > 0) {
                $scope.categoryTitle = allGamesInCategory.categoryTitle;
            } else {
                // no games in the category, so redirect to home
                $location.path("/#"); 
            }
        } else {
            //TODO implement catch error
        }
    });
}

GenrepageController.$inject = ['$rootScope', '$scope', '$routeParams', '$location', 'gameDataSvc', 'genreService', '$analytics'];
module.exports = GenrepageController;
},{}],5:[function(require,module,exports){
function HomeController ($rootScope, $scope, gameDataSvc, userSvc, gatheringSvc, $timeout, $analytics) {
    $analytics.pageTrack('/member/home');

    // Set header
    $rootScope.showNormalNav = true;
//-----------------------
//Run homepage 
    function initHomepage() {
        initRecommended();
        initRecommendedBecauseYouPlayed();
        initNew();
        initTopRated();
        initCategories();
        $rootScope.homeInitDone = true;
    };

    var initRecent = function() {
        gameDataSvc.getRecentGames($rootScope.recentGameLimit).success(function(recentGames){
            if (!recentGames.error) {
                if (recentGames.gameList.length === 0) {
                    $rootScope.recentGames = null;
                } else {
                    $rootScope.recentGames = recentGames.gameList;
                }
            } else {
                gatheringSvc.sendErrorInfo('GetRecentGames', ' Error: failed getting recent games. Reason: ' + recentGames.error);
            }
        });
    };

    var initNew = function(){
        gameDataSvc.getNewGames($rootScope.gameStartCount, $rootScope.newGameLimit).success(function(games){
            if (!games.error) {
                if (games.gameList.length === 0) {
                    $rootScope.newGames = null
                } else {
                    $rootScope.newGames = games.gameList;
                }
                if ($rootScope.newGames !== null) {
                    $rootScope.categoryCounter['newGames'] = parseInt($rootScope.newGames.length);
                    $rootScope.showLoadMore['newGames'] = (games.gameListSize > $rootScope.newGameLimit);
                }
            } else {
                gatheringSvc.sendErrorInfo('GetNewGames', ' Error: failed getting new games. Reason: ' + newGames.error);
            }
        });
    };

    var initRecommendedBecauseYouPlayed = function() {
        gameDataSvc.getRecommendedBecauseYouPlayedGames($rootScope.recommendedBecauseYouPlayedGameLimit).success(function(recommendedBecauseYouPlayedGames){
            if (!recommendedBecauseYouPlayedGames.error) {
                if (recommendedBecauseYouPlayedGames.gameList.length === 0 || recommendedBecauseYouPlayedGames.gameBasedTitle === null) {
                    $rootScope.recommendedBecauseYouPlayedGames = null;
                    $rootScope.recommendedBecauseYouPlayedGameTitle = null;
                } else {
                    $rootScope.recommendedBecauseYouPlayedGames = recommendedBecauseYouPlayedGames.gameList;
                    $rootScope.recommendedBecauseYouPlayedGameTitle = recommendedBecauseYouPlayedGames.gameBasedTitle;
                }
            } else {
                gatheringSvc.sendErrorInfo('GetRecommendedBecauseYouLikedGames', ' Error: failed getting item-based recommended games. Reason: ' + recommendedBecauseYouPlayedGames.error);
            }
        });

    };

    var initRecommended = function(loadedGames) {
        // Total amount to be displayed in Hero image and recommended games bar
        var amountDisplayable = $rootScope.recommendedGameLimit + $rootScope.heroGamesLimit;

        gameDataSvc.getRecommendedGames(amountDisplayable).success(function(recommendedGames){
            if (!recommendedGames.error) {
                if (recommendedGames.gameList.length === 0) {
                    $rootScope.recommendedGames = null;
                } else {
                    $rootScope.recommendedGames = recommendedGames.gameList;
                }

                if ($rootScope.recommendedGames !== null) {
                    $rootScope.categoryCounter['recommendedGames'] = parseInt($rootScope.recommendedGames.length);
                    $rootScope.recommendedGamesRow = $rootScope.recommendedGames.slice($rootScope.heroGamesLimit);                    
                    $rootScope.showLoadMore['recommendedGames'] = (recommendedGames.gameListSize > $rootScope.categoryCounter['recommendedGames']);
                }
            }
            else {
                gatheringSvc.sendErrorInfo('GetRecommendedGames', ' Error: failed getting recommended games. Reason: ' + recommendedGames.error);
            }
        });
    };
    
    var initTopRated = function() {
        gameDataSvc.getTopRatedGames($rootScope.gameStartCount, $rootScope.topRatedGameLimit).success(function(topRatedGames) {
                if (!topRatedGames.error) {
                    if (topRatedGames.gameList.length === 0) {
                        $rootScope.topRatedGames = null;
                    } else {
                        $rootScope.topRatedGames = topRatedGames.gameList;
                    }
                    if ($rootScope.topRatedGames !== null) {
                        $rootScope.categoryCounter['topRatedGames'] = parseInt($rootScope.topRatedGames.length);
                        $rootScope.showLoadMore['topRatedGames'] = (topRatedGames.gameListSize > $rootScope.categoryCounter['topRatedGames']);
                    }
                } else {
                    gatheringSvc.sendErrorInfo('GetTopRatedGames', ' Error: failed getting top rated games. Reason: ' + topRatedGames.error);
                }
            }
       );
    };

    var initCategories = function() {
        gameDataSvc.getAllCategories('allCategories').success(function(allCategories){
            if (!allCategories.error) {
                Object.keys(allCategories).length === 0 ? $rootScope.allCategories = null : $rootScope.allCategories = allCategories;
            } else {
                gatheringSvc.sendErrorInfo('GetAllCategories', ' Error: failed getting all categories. Reason: ' + allCategories.error);
            }
        }).then(function(){
            angular.forEach($rootScope.allCategories, function(value){
                gameDataSvc.getCategoryGames(value.functionalId, $rootScope.gameStartCount, $rootScope.categoryGameLimit).success(function(categoryGames){
                    if (!categoryGames.error) {
                        var gameList;
                        if (categoryGames.gameList.length === 0) {
                            gameList = null;
                        } else {
                            gameList = categoryGames.gameList;
                        }
                        if (gameList !== null) {
                            $rootScope.allCategoryGames[value.functionalId] = gameList;
                            $rootScope.categoryCounter[value.functionalId] = parseInt(gameList.length);
                            $rootScope.showLoadMore[value.functionalId] = (categoryGames.gameListSize > $rootScope.categoryCounter[value.functionalId]);
                        }
                    } else {
                        gatheringSvc.sendErrorInfo('GetCategoryGames', ' Error: failed getting ' + value.functionalId + ' games. Reason: ' + categoryGames.error);
                    }
                });
            });
        }); 
    };

    //--------------------------
    // "Load More" events for games
    $scope.loadMoreNewGames = function() {
        gameDataSvc.getNewGames(Math.floor($rootScope.categoryCounter['newGames'] / $rootScope.moreGameLimit), $rootScope.moreGameLimit).success(function(games){
            if (!games.error) {
                $rootScope.newGames.push.apply($rootScope.newGames, games.gameList);
                $rootScope.categoryCounter['newGames'] = parseInt($rootScope.newGames.length);
                $rootScope.showLoadMore['newGames'] = (games.gameListSize > $rootScope.categoryCounter['newGames']);
            } else {
                gatheringSvc.sendErrorInfo('GetNewGames', ' Error: failed getting MORE new games. Reason: ' + games.error);
            }
        });
    };
    $scope.loadMoreTopRatedGames = function() {
        gameDataSvc.getTopRatedGames(Math.floor($rootScope.categoryCounter['topRatedGames'] / $rootScope.moreGameLimit), $rootScope.moreGameLimit).success(function(games){
            if (!games.error) {
                $rootScope.topRatedGames.push.apply($rootScope.topRatedGames, games.gameList);
                $rootScope.categoryCounter['topRatedGames'] = parseInt($rootScope.topRatedGames.length);
                $rootScope.showLoadMore['topRatedGames'] = (games.gameListSize > $rootScope.categoryCounter['topRatedGames']);
            } else {
                gatheringSvc.sendErrorInfo('GetTopRatedGames', ' Error: failed getting MORE top rated games. Reason: ' + games.error);
            }
        });
    };
    $scope.loadMoreCategoryGames = function(category) {
        gameDataSvc.getCategoryGames(category, Math.floor($rootScope.categoryCounter[category]/$rootScope.moreGameLimit), $rootScope.moreGameLimit).success(function(games){
            if (!games.error) {
                $rootScope.allCategoryGames[category].push.apply($rootScope.allCategoryGames[category], games.gameList);
                $rootScope.categoryCounter[category] = parseInt($rootScope.allCategoryGames[category].length);
                $rootScope.showLoadMore[category] = (games.gameListSize > $rootScope.categoryCounter[category]);
            } else {
                gatheringSvc.sendErrorInfo('GetCategoryGames', ' Error: failed getting MORE ' + category + ' games. Reason: ' + games.error);
            }
        });
    };

    if ($rootScope.homeInitDone === false) {
        initHomepage();
    } else {
        // only refresh rows that can change often depending on the behavior of the user
        initRecent();
    }

    angular.element(document).ready(function() {
        $timeout(function () {
            $rootScope.loading = true;
        }, 10);
    });
}

HomeController.$inject = ['$rootScope', '$scope', 'gameDataSvc', 'userSvc', 'gatheringSvc', '$timeout', '$analytics'];
module.exports = HomeController;
},{}],6:[function(require,module,exports){
function MyAccountMembershipController ($rootScope, $scope, accountService, $modal) {

    // Set header
    $rootScope.showNormalNav = true;

    $scope.loading = true;


    // Fetch the first name from cache or server (fallback)
    accountService.getName().then(function (name) {
        $scope.firstName = name;
    });


    var loadMembershipDetails = function () {
        accountService.getEntitlement().then(setMembershipDetails);
    };


    var setMembershipDetails = function (response) {
        $scope.loading = false;
        $scope.membership = response.data;
    };


    // When a payment has been done
    $rootScope.$on('payment:done', function (event, response) {
        $rootScope.currentModal.close(null);
        $rootScope.$broadcast('notification:confirm', 'Your credit card details have been updated!');
        loadMembershipDetails();
    });


    $scope.isPayingMember = function () {
        if ($scope.membership) {
            if ($scope.membership.status === 'ACTIVE') {
                return true;
            }
            return false;
        }

        return undefined;
    };


    $scope.cancelMembership = function () {
        alert('Not implemented yet');
    };


    $scope.openPaymentModal = function () {
        $rootScope.currentModal = $modal.open({
            templateUrl: $rootScope.cdnUrl + '/views/popups/updatePaymentDetails.html',
            size: 'update-payment-details',
            backdrop: 'static',
            keyboard: false
        });
    }


    loadMembershipDetails();
}

MyAccountMembershipController.$inject = ['$rootScope', '$scope', 'accountService', '$modal'];
module.exports = MyAccountMembershipController;
},{}],7:[function(require,module,exports){
function MyAccountPasswordController ($rootScope, $scope, accountService) {
    // Set header
    $rootScope.showNormalNav = true;

    $scope.busy = false; // keep track of in-progress HTTP-POST-calls

    // Set some defaults
    $scope.showPassword = true;

    $scope.changePassword = {
        oldPassword: '',
        newPassword: ''
    };


    // Fetch the first name from cache or server (fallback)
    accountService.getName().then(function (name) {
        $scope.firstName = name;
    });



    $scope.submitPasswordChange = function () {
        if ($scope.busy === true) {
            return;
        }

        // Do not submit of there are errors in the form
        if ($scope.changePassword.$valid !== true) {
            return;
        }

        $scope.busy = true;

        // Reset error messages
        $scope.changePasswordErrors = {};

        // Do the request to change the password
        accountService.changePassword($scope.changePassword).then(passwordChangeSuccess, passwordChangeError);
    };


    var passwordChangeSuccess = function () {
        $scope.busy = false;

        // Reset the form
        $scope.changePassword.newPassword = '';
        $scope.changePassword.oldPassword = '';
        $scope.changePassword.$setPristine();

        // Send notification
        $rootScope.$broadcast('notification:confirm', 'Your account has been updated!');
    };


    var passwordChangeError = function (response) {
        $scope.busy = false;

        // Set error messages for use in the view
        $scope.changePasswordErrors = accountService.getErrors(response);

        // Send notification
        $rootScope.$broadcast('notification:error', 'Something went wrong changing your password.');
    };

}

MyAccountPasswordController.$inject = ['$rootScope', '$scope', 'accountService'];
module.exports = MyAccountPasswordController;
},{}],8:[function(require,module,exports){
function MyAccountProfileController ($rootScope, $scope, accountService) {
    // Set header
    $rootScope.showNormalNav = true;

    $scope.busy = false; // keep track of in-progress HTTP-POST-calls


    // Initiate fetching the account details
    var loadAccountDetails = function () {
        accountService.getAccount().then(setAccount);
    };


    // Sets the account details from the response
    var setAccount = function (response) {
        var account = response.data;
        $scope.firstName = account.name;
        $scope.account = angular.copy(account);
    };


    $scope.submitAccountDetails = function () {
        if ($scope.busy === true) {
            return;
        }

        // Do not submit of there are errors in the form
        if ($scope.profile.$valid !== true) {
            return;
        }

        $scope.busy = true;

        // Reset the error messages
        $scope.accountErrors = {};

        // Request to change the details
        accountService.setAccount($scope.account).then(accountSuccess, accountError);
    };


    var accountSuccess = function () {
        $scope.busy = false;

        // Re-load the account details
        loadAccountDetails();

        // Reset the form status to unsubmitted
        $scope.profile.$setPristine();

        // Show a notification
        $rootScope.$broadcast('notification:confirm', 'Your account has been updated!');
        
    };


    var accountError = function (response) {
        $scope.busy = false;

        // Set the error messages for use in the view
        $scope.accountErrors = accountService.getErrors(response);

        // Show a notification
        $rootScope.$broadcast('notification:error', 'Something went wrong saving your account.');
    };


    // Format the phone number on-blur:
    // Only digits are alowed
    $scope.formatPhoneNumber = function () {
        $scope.account.phoneNumber = $scope.account.phoneNumber.replace(/\D/g, '');
    };


    loadAccountDetails();

}

MyAccountProfileController.$inject = ['$rootScope', '$scope', 'accountService'];
module.exports = MyAccountProfileController;
},{}],9:[function(require,module,exports){
function MyAccountSettingsController ($rootScope, $scope, accountService) {

    // Set header
    $rootScope.showNormalNav = true;


}

MyAccountSettingsController.$inject = ['$rootScope', '$scope', 'accountService'];
module.exports = MyAccountSettingsController;
},{}],10:[function(require,module,exports){
function PaymentController ($rootScope, $scope, accountService, userSvc, $location) {
    //Check if player is logged in (global load is sometimes to late), need to redesign to more efficient way.
    userSvc.getPlayer().then(function(response){
        if(!response.data){
            $location.path('/');
        } else{
            if(response.data.isEntitled){
                $location.path('/');
            }
            if(!response.data.isLoggedIn){
                $location.path('/signup');
            }
        }
    });


    // Set header adjustments for payment flow
    $rootScope.showNormalNav = false;


    // When a payment has been done
    $rootScope.$on('payment:done', function (event, response) {
        //Retrieve the latest player details with the correct entitlement status so the user can play!
        userSvc.getPlayer().then(function(response){
            $rootScope.player = response.data;

            if(!response.data){
                gatheringSvc.sendErrorInfo('GetPlayer', ' Error: failed getting player after subscribing / ' + response.error);
            } else{
                dataLayer.push({
                    'event': 'paymentSuccess',
                    'userId': $rootScope.player.userId,
                    'userEmail': $rootScope.player.email
                });
                __insp.push(['identify', 'pid: '+$rootScope.player.userId]);
            }
        }).then(function(){
            //When we retrieved the player account send them to the success page.
            $location.path('/success');
        });
    });
}

PaymentController.$inject = ['$rootScope', '$scope', 'accountService', 'userSvc', '$location'];
module.exports = PaymentController;
},{}],11:[function(require,module,exports){
function RecentgamesController ($rootScope, $scope, $location, gameDataSvc, $analytics) {
    $analytics.pageTrack('/recently-played');

    // Set header
    $rootScope.showNormalNav = true;

    $scope.categoryTitle = 'Recently Played';
    
    gameDataSvc.getAllRecentGames().success(function(recentGames){
        if(!recentGames.error) {
            recentGames.gameList.length === 0 ? $scope.recentGames = null : $scope.recentGames = recentGames.gameList;
        } else {
            $location.path("/#");
        }
    });
}

RecentgamesController.$inject = ['$rootScope', '$scope', '$location', 'gameDataSvc', '$analytics'];
module.exports = RecentgamesController;
},{}],12:[function(require,module,exports){
function SignupController ($rootScope, $scope, accountService, $location, gatheringSvc, userSvc) {
    //Check if player is logged in (global load is sometimes to late), need to redesign to more efficient way.
    userSvc.getPlayer().then(function(response){
        if(!response.data){
            $location.path('/');
        } else{
            if(response.data.isEntitled){
                $location.path('/');
            }
            if(response.data.isLoggedIn){
                $location.path('/payment');
            }
        }
    });

    $scope.busy = false; // keep track of in-progress HTTP-POST-calls


    // Set header adjustments for payment flow
    $rootScope.showNormalNav = false;

    // Set some defaults
    $scope.showPassword = false;

    $scope.submitSignUp = function () {
        if ($scope.busy === true) {
            return;
        }

        // Do not submit if there are errors in the form
        if ($scope.signup.$valid !== true) {
            gatheringSvc.sendCreateAccountSubmitError($scope.signup.emailAddress.$viewValue+'',
                !$scope.signup.emailAddress.$invalid,
                !$scope.signup.password.$invalid);
            return;
        }

        $scope.busy = true;

        // Reset error messages
        $scope.signupErrors = {};

        //Retrieve deviceId if available
        if($rootScope.player){
            $scope.account.deviceId = $rootScope.player.deviceId;
        }

        // Do the request to signup user
        accountService.createAccount($scope.account).then(signUpSuccess, signUpError);
    };

    var signUpSuccess = function () {
        $scope.busy = false;

        //Signup was a succes, let's retrieve the player account and set it on the scope. Also push
        //the details to google/other services.
        userSvc.getPlayer().then(function(response){
            $rootScope.player = response.data;

            if(!response.data){
                gatheringSvc.sendErrorInfo('GetPlayer', ' Error: failed getting player after registration data / ' + response.error);
            } else{
                dataLayer.push({
                    'event': 'signUpSuccess',
                    'userId': $rootScope.player.userId,
                    'userEmail': $rootScope.player.email
                });
                __insp.push(['identify', 'pid: '+$rootScope.player.userId]);
            }
        }).then(function(){
            //If we retrieved the player details notify the user.
            gatheringSvc.sendCreateAccountSuccess();

            // Reset the form status to unsubmitted
            $scope.signup.$setPristine();

            //Let's continue to the payment step.
            $location.path('/payment');
        });
    };

    var signUpError = function (response) {
        $scope.busy = false;

        // Set error messages for use in the view
        $scope.signupErrors = accountService.getErrors(response);

        gatheringSvc.sendCreateAccountError($scope.account.emailAddress, $scope.signupErrors);

        //If the error is because of a legacy account already existing send them to the legacy website,
        //the cookies are already prepared by the backend.
        if($scope.signupErrors.legacy === 'true'){
            window.location.href = '/';
        } else {
            // Send notification
            $rootScope.$broadcast('notification:error', 'Something went wrong with creating your account.');
        }
    };
}

SignupController.$inject = ['$rootScope', '$scope', 'accountService', '$location', 'gatheringSvc', 'userSvc'];
module.exports = SignupController;
},{}],13:[function(require,module,exports){
function SuccessController ($rootScope, $scope, accountService, gameDataSvc, $location) {
    // Set header adjustments for payment flow
    $rootScope.showNormalNav = true;

    $scope.hideLoader = true;
    $scope.buttonText = 'GO TO HOMEPAGE';
    if($rootScope.postTrialContentId !== ''){
        $scope.buttonText = 'CONTINUE PLAYING';
    }

    $scope.continuePlaying = function() {
        if($rootScope.postTrialContentId !== ''){
            $scope.buttonText = '';
            $scope.hideLoader = false;
            gameDataSvc.getSpecificGameByContentId($rootScope.postTrialContentId).success(function(data){
                if (data && data.contentId && data.id) {
                    $rootScope.playGame(data);
                    setTimeout(function(){
                        $location.path('/');
                    }, 20000);
                }
            });
        } else {
            $location.path('/');
        }
    };
}

SuccessController.$inject = ['$rootScope', '$scope', 'accountService', 'gameDataSvc', '$location'];
module.exports = SuccessController;
},{}],14:[function(require,module,exports){
function Carousel ($interval) {

    var nextSlide = function (scope) {
        var index = (scope.activeIndex + 1) % scope.carouselItems.length;
        scope.activeIndex = index;
    };

    return {
        restrict: 'C',
        controller: function($scope) {

            $scope.activeIndex = null;
            $scope.carouselItems = [];
            $scope.carouselDuration = 6000;

            $scope.goToSlide = function (index) {
                $scope.activeIndex = index;
            };

            $scope.timer = $interval(nextSlide.bind({}, $scope), $scope.carouselDuration);

            var setCarouselItems = function () {
                if (!$scope.$root.recommendedGames) {
                    return;
                }

                $scope.activeIndex = 0;
                $scope.carouselItems = $scope.$root.recommendedGames.slice(0, $scope.$root.heroGamesLimit);
            };

            $scope.$root.$watch('recommendedGames', setCarouselItems);
        },
        link: function (scope, element) {
            var clearInterval = function () {
                if (angular.isDefined(scope.timer)) {
                    $interval.cancel(scope.timer);
                    scope.timer = undefined;
                }

                scope.timer = $interval(nextSlide.bind({}, scope), scope.carouselDuration);
            };

            element.on('mousemove', clearInterval);
        }
    };
}



Carousel.$inject = ['$interval'];
module.exports = Carousel;
},{}],15:[function(require,module,exports){
function Carousel ($sce) {
    return {
        replace: 'true',
        restrict: 'E',
        scope: {
            gamebox: '=',
            isIE9: '=isIe9'
        },
        templateUrl: 'subviews/carousel.html',
        link: function(scope) {
            var trustedVideoUrl = $sce.trustAsResourceUrl(scope.gamebox.gameVideos.video1);
            var videoPosterUrl = scope.gamebox.gameImages.large;
            var screenShots = scope.gamebox.gameScreenShots;
            scope.slides = [
                {'type': 'video','url': trustedVideoUrl, 'posterUrl': videoPosterUrl},
                {'type': 'image','url': screenShots.screenShot1},
                {'type': 'image','url': screenShots.screenShot2},
                {'type': 'image','url': screenShots.screenShot3}
            ];
            scope.indexOfSelectedSlide = 0;
            scope.numberOfItems = 4;
            scope.selectSlide = function (index) {
                scope.indexOfSelectedSlide = (index % scope.numberOfItems + scope.numberOfItems) % scope.numberOfItems;
            };
        }
    };
}



Carousel.$inject = ['$sce'];
module.exports = Carousel;
},{}],16:[function(require,module,exports){
function Gamebox ($rootScope) {
    return {
        replace: 'true',
        restrict: 'E',
        scope: {
            games: '=',
            irregular: '=',
            irregularcount: '=',
            continueplaying: '=',
            showgenreinfo: '=',
            currentpage: '@'
        },
        templateUrl: 'subviews/gamebox.html',
        link: function(scope) {
            scope.gameManager = $rootScope.gameManager;
            scope.playGame = $rootScope.playGame;
        }
    };
}



Gamebox.$inject = ['$rootScope'];
module.exports = Gamebox;
},{}],17:[function(require,module,exports){
function MyAccountNavigation () {
    return {
        restrict: 'E',
        scope: {
            'active': '@'
        },
        templateUrl: 'subviews/my-account-navigation.html',
        controller: function ($scope) {
            $scope.tabs = [
                { url: 'profile', title: 'Profile' },
                { url: 'password', title: 'Password' },
                { url: 'membership', title: 'Membership' },
                { url: 'settings', title: 'Preferences' }
            ];
        }
    };
}


module.exports = MyAccountNavigation;
},{}],18:[function(require,module,exports){
function NotificationBanner ($rootScope, $timeout) {



    return {
        restrict: 'E',
        controller: function($scope, $element) {

            var timer;

            $scope.className = null;
            $scope.message = '';
            $scope.open = null;


            var openBanner = function () {
                // Be sure to add the CSS-class a bit later to trigger the CSS-transition
                $timeout(function () {
                    $scope.open = 'is-open';
                }, 0);

                $timeout.cancel(timer);
                timer = $timeout(closeBanner, 5000);
            };

            var closeBanner = function () {
                $scope.$apply(function () {
                    $scope.open = null;
                });
            };

            $rootScope.$on('notification:confirm', function (event, message) {
                $scope.className = 'confirm';
                $scope.message = message;
                openBanner();
            });

            $rootScope.$on('notification:error', function (event, message) {
                $scope.className = 'error';
                $scope.message = message;
                openBanner();
            });

            $element.on('click', closeBanner);

        }
    };
}



NotificationBanner.$inject = ['$rootScope', '$timeout'];
module.exports = NotificationBanner;
},{}],19:[function(require,module,exports){
function Nps ($rootScope, gatheringSvc, $cookies) {
    return {
        restrict: 'E', 
        templateUrl: 'subviews/nps.html',
        link: function($scope) {
            $scope.step1 = true, $scope.step2 = false, $scope.step3 = false;
            $scope.promotorMsg = false, $scope.neutralMsg = false, $scope.detractorMsg = false;
            var userRating;
            $scope.npsRating = function(rating) {
                gatheringSvc.sendNpsInfo($rootScope.player.userId, rating);
                $scope.step1 = false;
                $scope.step2 = true;
                userRating = rating;
                //Set cookie for 30 days
                $cookies.put('ghnps', 'false', {path: '/', expires: new Date((new Date()).getTime() + (30 * 86400000))});
            };
            $scope.npsComment = function(comment) {
                gatheringSvc.sendNpsCommentInfo($rootScope.player.userId, userRating, comment);
                $scope.step2 = false;
                $scope.step3 = true;
                
                if(userRating === '4' || userRating === '5'){
                    $scope.promotorMsg = true;
                } else if(userRating === '3'){
                    $scope.neutralMsg = true;
                } else if(userRating === '2' || userRating === '1'){
                    $scope.detractorMsg = true;
                }
                //Set cookie for 30 days
                $cookies.put('ghnps', 'false', {path: '/', expires: new Date((new Date()).getTime() + (30 * 86400000))});
            };
        }
    };
}


Nps.$inject = ['$rootScope', 'gatheringSvc', '$cookies'];
module.exports = Nps;
},{}],20:[function(require,module,exports){
function Search (gameDataSvc, gatheringSvc) {
    return {
        replace: 'true',
        restrict: 'E',
        scope: {},
        templateUrl: 'subviews/search.html',
        controller: function($scope) {
            $scope.allGamesList = [];
            $scope.query = '';
            $scope.queryHasFocus = false;
            // boolean flag that denotes whether the user has started clicking in the results
            // used to delay hiding the results until click is done
            $scope.clickOnSearchResultHasStarted = false;
            $scope.results = [];
            $scope.hiddenResults = null;

            $scope.resetQuery = function() {
                $scope.query = '';
            };

            // Show the results only when the input field had focus
            $scope.showResults = function () {
                $scope.queryHasFocus = true;
            };

            $scope.hideResults = function () {
                $scope.queryHasFocus = false;
            };

            $scope.setClickOnSearchResultHasStarted = function(hasStarted) {
                $scope.clickOnSearchResultHasStarted = hasStarted;
            };

            // add all the hidden search results to the visible results
            $scope.showAllResults = function() {
                $scope.queryHasFocus = true;
                $scope.results = $scope.results.concat($scope.hiddenResults);
                $scope.hiddenResults = null;

                gatheringSvc.sendBiSearchInfo($scope.query.trim(), $scope.results.length, "showall");

                // give focus to the search input to avoid automatically closing the search results
                var elementResult = angular.element(document.getElementById("game-query"));
                elementResult.focus();
            };

            $scope.getGames = function () {
                var query = $scope.query.trim();
                if (query.length > 0) {
                    gameDataSvc.getSearchedGames(query).success(function (data) {
                        if (data && !data.error) {
                            gatheringSvc.sendBiSearchInfo(query, data.length, "searchbar");
                            // if there are more than 20 results, only show the first 15
                            if (data.length > 20) {
                                $scope.results = data.slice(0,15);
                                $scope.hiddenResults = data.slice(15);
                            } else {
                                // reset the remainder
                                $scope.results = data;
                                $scope.hiddenResults = null;
                            }
                        }
                    }).error(function () {
                        gatheringSvc.sendErrorInfo('SearchForGamesByQuery', ' Error: failed getting search results. Search term: ' + $scope.query);
                    });
                }
            };
        }
    };
}


Search.$inject = ['gameDataSvc', 'gatheringSvc'];
module.exports = Search;
},{}],21:[function(require,module,exports){
// Zuora Directive
//
// usage:
//
// Include the directive in a template, like :
// <zuorapayment></zuorapayment>
//
// Then watch for an event on the $rootScope when the Payment is done:
//
// $rootScope.$on('payment:done', function (response) { /* success */ });
//
function ZuoraPayment (zuoraService, $rootScope) {

    return {
        restrict: 'E',
        templateUrl: 'subviews/zuora-payment.html',
        scope: {
            type: '@type'
        },
        controller: function($scope, $element) {
            $scope.loading = true;

            // When rendering is done..
            // The `zuora` argument contains a promise in `payment` :
            // when a payment has been made
            var done = function (zuora) {
                $scope.loading = false;

                // When the player succesfully submits payment information to Zuora
                zuora.payment.then(function (response) {
                    // Notify any controllers of a payment that has been done
                    $rootScope.$broadcast('payment:done', response);
                });
            };

            // Error while rendering Zuora
            // Give a notification
            var error = function () {
                $rootScope.$broadcast('notification:error', 'Something went wrong. Please try again or contact us.');
            };

            // Start rendering the form
            // The `renderPaymentForm` will return an Angular Promise
            var rendering = zuoraService.renderPaymentForm($scope.type);
            rendering.then(done, error);
        }
    };
}



ZuoraPayment.$inject = ['zuoraService', '$rootScope'];
module.exports = ZuoraPayment;
},{}],22:[function(require,module,exports){
function IsEmpty () {
    var bar;
    return function (obj) {
        for (bar in obj) {
            if (obj.hasOwnProperty(bar)) {
                return false;
            }
        }
        return true;
    };
}




module.exports = IsEmpty;
},{}],23:[function(require,module,exports){
// show a star rating and the number of ratings. Expects a rating (float, 0 <= rating <= 10) and a number of ratings (integer, nrOfRatings >= 0)
// If there are any ratings:
// - a number of "active" stars and half-stars is displayed corresponding to half the rating (since the maximum number of stars is 5)
// - 5 inactive stars are displayed
// - active stars are placed on top of the inactive stars
function ShowRatingStars ($sce) {
    return function(rating, nrOfRatings) {
        var noRatingMessage = '<span class="ratingMessage">There aren\'t enough ratings yet</span>';
        var backgroundStars = '<span class="backgroundStars"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span></span>';
        // sanitize rating parameter
        if (isFinite(String(rating).trim() || NaN) && nrOfRatings >= 1) {
            // clean up strange edge cases that should never happen
            if (rating <= 0) {
                return $sce.trustAsHtml(backgroundStars + noRatingMessage);
            } else if (rating > 10) {
                rating = 10;
            }

            var roundedRating = Math.round(rating);
            var halfRating = Math.floor(roundedRating/2);
            var nrOfRemaiingStars = 5;

            // open "active" block that is placed over the backgroundStars block
            var activeStars = '<span class="active">';

            // fill active block with full and half stars
            for (var i = 0; i < halfRating; i++) {
                activeStars += '<span class="icon-star"></span>';
                nrOfRemaiingStars--;
            }
            if (roundedRating % 2 === 1) {
                activeStars += '<span class="icon-star-half"></span>';
                nrOfRemaiingStars--
            }

            // fill the remainder of the block with inactive stars to get the message after the stars positioned correctly
            var inactiveStars = '';
            for (var j = 0; j < nrOfRemaiingStars; j++ ) {
                inactiveStars += '<span class="icon-star inactive"></span>';
            }

            // close "active" block
            activeStars += inactiveStars + '</span>';

            // display number of ratings
            var nrOfRatingsMessage = '<span class="ratingMessage">' + nrOfRatings;
            if (nrOfRatings == 1) {
                nrOfRatingsMessage += ' rating</span>';
            } else {
                nrOfRatingsMessage += ' ratings</span>';
            }
            // assemble full display of stars & number of ratings message
            return $sce.trustAsHtml('<span class="ratingStars">' + backgroundStars + activeStars + '</span>' + nrOfRatingsMessage);
        } else {
            // no ratings are present
            return $sce.trustAsHtml(backgroundStars + noRatingMessage);
        }
    }
}


ShowRatingStars.$inject = ['$sce'];
module.exports = ShowRatingStars;
},{}],24:[function(require,module,exports){
function ToArray () {
  return function (obj, addKey) {
    if (!angular.isObject(obj)) return obj;
    if ( addKey === false ) {
      return Object.keys(obj).map(function(key) {
        return obj[key];
      });
    } else {
      return Object.keys(obj).map(function (key) {
        var value = obj[key];
        return angular.isObject(value) ?
          Object.defineProperty(value, '$key', { enumerable: false, value: key}) :
          { $key: key, $value: value };
      });
    }
  };
}




module.exports = ToArray;
},{}],25:[function(require,module,exports){
var app = angular.module('gamehouseApp', ['ngResource', 'ngRoute', 'ngSanitize', 'angulartics', 'angulartics.google.analytics', 'ui.bootstrap', 'angular-svg-round-progress', 'stBlurredDialog', 'templates', 'angular-mailcheck', 'vAccordion', 'ngCookies']);

/*
 * Routing
 */
app.config(['$routeProvider', '$analyticsProvider', '$sceDelegateProvider', function ($routeProvider, $analyticsProvider, $sceDelegateProvider) {
    $analyticsProvider.settings.ga.additionalAccountNames = ['platformTracker'];
    $analyticsProvider.virtualPageviews(false);
    // whitelist the CDN URL for purposes of getting Angular resources
    $sceDelegateProvider.resourceUrlWhitelist([
        'self',
        memberStaticHostUrl + '/**'
    ]);
    $routeProvider
    // "Regular" pages: home page, game, listing pages
    .when('/', {
        templateUrl: 'homeView.html',
        controller: 'HomeController'
    })
    .when('/games/:seoName', {
        templateUrl: 'gamepageView.html',
        controller: 'GamepageController'
    })
    .when('/genre/:functionalId', {
        templateUrl: 'genrepageView.html',
        controller: 'GenrepageController'
    })
    .when('/recently-played', {
        templateUrl: 'recentgamesView.html',
        controller: 'RecentgamesController'
    })
    // My Account tabs
    .when('/my-account/profile', {
        templateUrl: 'myAccountProfileView.html',
        controller: 'MyAccountProfileController'
    })
    .when('/my-account/password', {
        templateUrl: 'myAccountPasswordView.html',
        controller: 'MyAccountPasswordController'
    })
    .when('/my-account/membership', {
        templateUrl: 'myAccountMembershipView.html',
        controller: 'MyAccountMembershipController'
    })
    .when('/my-account/settings', {
        templateUrl: 'myAccountSettingsView.html',
        controller: 'MyAccountSettingsController'
    })
    // Sign-up flow
    .when ('/signup', {
        templateUrl: 'signupView.html',
        controller: 'SignupController'
    })
    .when ('/payment', {
        templateUrl: 'paymentView.html',
        controller: 'PaymentController'
    })
    .when ('/success', {
        templateUrl: 'successView.html',
        controller: 'SuccessController'
    })
    // "Edge" pages like Help, Contact, etc
    .when('/about-us', {
        templateUrl: 'aboutpageView.html'
    })
    .when('/contact', {
        templateUrl: 'contactpageView.html',
        controller: 'ContactpageController'
    })
    .when('/help', {
        templateUrl: 'faqpageView.html',
        controller: 'FaqpageController'
    })
    .when('/terms-of-service', {
        templateUrl: 'termsOfServiceView.html'
    })
    .otherwise({
        redirectTo: '/'
    });
}]).run(['$rootScope', 'gatheringSvc', 'userSvc', 'amiSvc', 'gameDataSvc', '$modal', '$location', 'stBlurredDialog', '$cookies', 'abtestService', function($rootScope, gatheringSvc, userSvc, amiSvc, gameDataSvc, $modal, $location, stBlurredDialog, $cookies, abtestService){
    //Initiate some default values to assure correct function of the website.
    userSvc.checkVisitorId();
    $rootScope.player = userSvc.getDefaultPlayer();
    $rootScope.playerOs = '';
    $rootScope.playerBrowser = '';
    $rootScope.playerDevice = '';

    $rootScope.abtest = abtestService.initialize();
    // TODO This var needs to be removed when we have a decent video player
    $rootScope.isIE9 = false;

    $rootScope.denyPlayerAccess = false;
    $rootScope.homeInitDone = false;
    $rootScope.loading = false;
    $rootScope.newGames = null;
    $rootScope.recommendedGames = null;
    $rootScope.recommendedBecauseYouPlayedGames = null;
    $rootScope.recommendedBecauseYouPlayedGameTitle = null;
    $rootScope.allCategories = [];
    $rootScope.allCategoryGames = [];
    $rootScope.categoryCounter = [];
    $rootScope.newGameCounter = [];
    $rootScope.hideGameRow = [];
    $rootScope.showLoadMore = [];
    $rootScope.mobileView = false;
    $rootScope.gameStartCount = 0;
    $rootScope.playGameContentId = 0;
    $rootScope.hasHeroData = false;

    // Set header adjustments for payment flow
    $rootScope.showNormalNav = true;

    // make cdn image resources available within angular views
    $rootScope.cdnUrl = memberStaticHostUrl;

    // initial number of gameboxes, ordered by appearance on homepage
    // irregular rows (first box in row is double-sized)
    $rootScope.recentGameLimit = 3;
    $rootScope.recommendedBecauseYouPlayedGameLimit = 7;
    // regular rows (all boxes are single-sized)
    $rootScope.recommendedGameLimit = 4;
    $rootScope.categoryGameLimit = 4;
    $rootScope.newGameLimit = 4;
    $rootScope.topRatedGameLimit = 4;
    // number of (regular) boxes that's loaded when the "MORE GAMES" button is pressed
    $rootScope.moreGameLimit = 4;
    $rootScope.heroGamesLimit = 4;

    $rootScope.showNps = true;

    //-------------------------------------------------------------------
    // Declaration and initialisation of variables related to the Game Manager
    $rootScope.showGameManagerInWindow = function(visibility) {
        if(visibility === false){
            setTimeout(function(){
                $rootScope.showGameManagerWindow = visibility;
            }, 20000);
        } else {
            var header = angular.element( document.querySelector( 'header' ) );
            header.removeClass('header-hidden');
            $rootScope.showGameManagerWindow = visibility;
        }
    };

    //GAMEMANAGER VARS
    $rootScope.hasAMI = false;
    $rootScope.deviceId = '';
    $rootScope.amiModalGameContentId = '';
    $rootScope.postTrialContentId = '';

    $rootScope.gameManager = [];
    $rootScope.gameManager.downloadManagerCount = 0;
    $rootScope.gameManager.sessionGamesById = [];
    $rootScope.gameManager.sessionGamesByContentId = [];
    $rootScope.gameManager.sessionGamesInfo = [];
    $rootScope.gameManager.downloadQueue = [];
    $rootScope.gameManager.autoStartGame = '';
    $rootScope.gameManager.recommendedGames = [];
    $rootScope.gameManager.recommendedGamesEndOfHourTrial = [];

    //-------------------------------------------------------------------
    // register media query breakpoints by using enquire.js
    enquire
        .register("screen and (max-width: 767px)", function() {
            $rootScope.mobileView = true;
            $rootScope.recommendedBecauseYouPlayedGameLimit = 3;
        })
        .register("screen and (min-width: 768px) and (max-width: 991px)", function() {
            $rootScope.mobileView = false;
            $rootScope.recommendedBecauseYouPlayedGameLimit = 3;
        })
        .register("screen and (min-width: 992px) and (max-width: 1199px)", function() {
            $rootScope.mobileView = false;
            $rootScope.recommendedBecauseYouPlayedGameLimit = 7;
        })
        .register("screen and (min-width: 1200px)", function() {
            $rootScope.mobileView = false;
            $rootScope.recommendedBecauseYouPlayedGameLimit = 7;
        });


    function checkPlayerAccessAllowed() {
        function openMacModal() {
            $rootScope.currentModal = $modal.open({
                templateUrl: 'wrongOsBrowserModalMac.html',
                size: 'sm',
                backdrop: 'static',
                keyboard: false
            });
        }

        if ($rootScope.playerOs === 'MAC_OS' || $rootScope.playerOs === 'MAC_OS_X') {
            $rootScope.denyPlayerAccess = true;
            // suppress the Mac popup if you're on the contact page, otherwise it's inaccessible
            if ($location.path() !== '/contact') {
                openMacModal();
            }
        }
        else if($rootScope.playerBrowser === 'IE9') {
            $rootScope.isIE9 = true;
        }
    }
    function closeModal() {
        $rootScope.currentModal.dismiss();
    }

    function checkNps() {
        if($cookies.get('ghnps') !== undefined){
            $rootScope.showNps = false;
        }
    }

    /**
     * When somebody is kicked out of a game and signsup we want to start
     * the game directly after signup. In other cases this value need to be reset.
     */
    function checkPostTrialSignUp() {
        if($location.path() !== '/signup' && $location.path() !== '/payment'
            && $location.path() !== '/success'){
            $rootScope.postTrialContentId = '';
        }
    }

    // -------------------------------------------------------------------
    // Set player details in rootScope
    // 
    // BI PageVisit integration
    userSvc.getPlayer().then(function(response){
        $rootScope.player = response.data;
        if(!response.data){
            gatheringSvc.sendErrorInfo('GetPlayer', ' Error: failed getting player data / ' + response.error);
        }

        if($rootScope.player.userId === -1){
            aminstant.ready(function (){
                userSvc.getPlayerByDeviceId(aminstant.device_id).then(function(playerResponse){
                    $rootScope.player = playerResponse.data;
                });

            });
        }

        dataLayer.push({
            'userId': $rootScope.player.userId,
            'userEmail': $rootScope.player.email
        });
        __insp.push(['identify', 'pid: '+$rootScope.player.userId]);
    }).then(function(){
        userSvc.getPlayerBrowserOs().success(function(data){
            $rootScope.playerOs = data.operatingSystem;
            $rootScope.playerBrowser = data.browser;
            $rootScope.playerDevice = data.device;
        }).then(function(){
            //Validate the player is allowed to access the website.
            checkPlayerAccessAllowed();
            //Show the nps form
            checkNps();
            //Track this page visit.
            gatheringSvc.sendBiPageVisitInfo();
            //Track some additional data like screen resolution and useragent.
            gatheringSvc.sendExtendedPlayerDetails();
        });
    });

    // Load data needed to display the "Genres" dropdown menu
    gameDataSvc.getAllCategories('allCategories').success(function(allCategories){
        if (!allCategories.error) {
            $rootScope.allCategories = allCategories;
        } else {
            gatheringSvc.sendErrorInfo('GetCategories', ' Error: failed getting game categories');
        }
    });

    // Load data needed to display the GamesManager dropdown menu -- Recently played games
    gameDataSvc.getRecentGames($rootScope.recentGameLimit).success(function(recentGames){
        if (!recentGames.error) {
            if (recentGames.gameList.length === 0) {
                $rootScope.recentGames = [];
            } else {
                $rootScope.recentGames = recentGames.gameList;
            }
        } else {
            gatheringSvc.sendErrorInfo('GetRecentGames', ' Error: failed getting recent games. Reason: ' + recentGames.error);
        }
    });

    $rootScope.closeModal = function () {
        $rootScope.currentModal.dismiss();
    };

    // fake "closing" the Game Manager dropdown menu by hiding it temporarily
    $rootScope.closeGameManager = function() {
        $rootScope.showGameManagerWindow = false;
        var dropdown = angular.element( document.querySelector( '.game-manager .dropdown-menu' ) );
        dropdown.addClass('hidden');
        setTimeout(function(){
            dropdown.removeClass('hidden');
        }, 500);
    };

    $rootScope.determineGameManagerWidth = function() {
        if (!!$rootScope.gameManager && !!$rootScope.recentGames) {
            var maximum = Math.max(Object.keys($rootScope.gameManager.sessionGamesInfo).length, $rootScope.recentGames.length);
            if (maximum == 2) {
                return "wider";
            } else if (maximum >= 3) {
                return "widest";
            }
        }
        return "";
    };

    $rootScope.playGame = function(game){
        amiSvc.startGame(game);
        dataLayer.push({
            'event': 'playGame',
            'pageUrl': $location.absUrl(),
            'gameTitle': game.title,
            'gameId': game.seoName,
            'genre': game.genre.seoName
        });
    };

    $rootScope.subscribe = function(){
        stBlurredDialog.close();
        if($rootScope.player && $rootScope.player.isLoggedIn){
            $location.path('/payment');
        } else {
            $location.path('/signup');
        }
    };

    $rootScope.login = function(){
        window.location.href = '/csi/login?redirecturl='+ encodeURIComponent($location.absUrl());
    };


    window.onmouseup=function(){
        $rootScope.showGameManagerInWindow(false);
    };

    //Set the behaviour on virtual page view.
    $rootScope.$on('$routeChangeSuccess', function () {
        if($rootScope.currentModal) {
            closeModal();
        }
        //Close popup on route change.
        stBlurredDialog.close();

        //Validate the player is allowed to access the website.
        checkPlayerAccessAllowed();
        gatheringSvc.sendBiPageVisitInfo();
        checkNps();
        checkPostTrialSignUp();
        __insp.push(["virtualPage"]);
    });
}]);


app.controller('ContactpageController', require('./controllers/contactpageController.js'));
app.controller('FaqpageController', require('./controllers/faqpageController.js'));
app.controller('GamepageController', require('./controllers/gamepageController.js'));
app.controller('GenrepageController', require('./controllers/genrepageController.js'));
app.controller('HomeController', require('./controllers/homeController.js'));
app.controller('RecentgamesController', require('./controllers/recentgamesController.js'));


app.controller('MyAccountProfileController', require('./controllers/myAccountProfileController.js'));
app.controller('MyAccountPasswordController', require('./controllers/myAccountPasswordController.js'));
app.controller('MyAccountMembershipController', require('./controllers/myAccountMembershipController.js'));
app.controller('MyAccountSettingsController', require('./controllers/myAccountSettingsController.js'));


app.controller('SignupController', require('./controllers/signupController.js'));
app.controller('PaymentController', require('./controllers/paymentController.js'));
app.controller('SuccessController', require('./controllers/successController.js'));

app.factory('amiSvc', require('./services/ami.service.js'));
app.factory('accountService', require('./services/account.service.js'));
app.factory('faqService', require('./services/faq.service.js'));
app.factory('gameDataSvc', require('./services/gameData.service.js'));
app.factory('gatheringSvc', require('./services/dataGathering.service.js'));
app.factory('genreService', require('./services/genre.service.js'));
app.factory('retryService', require('./services/retry.service.js'));
app.factory('userSvc', require('./services/user.service.js'));
app.factory('zuoraService', require('./services/zuora.service.js'));
app.factory('abtestService', require('./services/abtest.service.js'));

app.directive('carousel', require('./directives/carousel.directive.js'));
app.directive('carousel', require('./directives/carousel-hero.directive.js'));
app.directive('gamebox', require('./directives/gamebox.directive.js'));
app.directive('nps', require('./directives/nps.directive.js'));
app.directive('search', require('./directives/search.directive.js'));
app.directive('notificationBanner', require('./directives/notification-banner.directive.js'));
app.directive('myaccountnavigation', require('./directives/my-account-navigation.directive.js'));
app.directive('zuorapayment', require('./directives/zuora-payment.directive.js'));

app.filter('isEmpty', require('./filters/is-empty.filter.js'));
app.filter('showRatingStars', require('./filters/show-rating-stars.filter.js'));
app.filter('toArray', require('./filters/to-array.filter.js'));




window.app = app;

},{"./controllers/contactpageController.js":1,"./controllers/faqpageController.js":2,"./controllers/gamepageController.js":3,"./controllers/genrepageController.js":4,"./controllers/homeController.js":5,"./controllers/myAccountMembershipController.js":6,"./controllers/myAccountPasswordController.js":7,"./controllers/myAccountProfileController.js":8,"./controllers/myAccountSettingsController.js":9,"./controllers/paymentController.js":10,"./controllers/recentgamesController.js":11,"./controllers/signupController.js":12,"./controllers/successController.js":13,"./directives/carousel-hero.directive.js":14,"./directives/carousel.directive.js":15,"./directives/gamebox.directive.js":16,"./directives/my-account-navigation.directive.js":17,"./directives/notification-banner.directive.js":18,"./directives/nps.directive.js":19,"./directives/search.directive.js":20,"./directives/zuora-payment.directive.js":21,"./filters/is-empty.filter.js":22,"./filters/show-rating-stars.filter.js":23,"./filters/to-array.filter.js":24,"./services/abtest.service.js":26,"./services/account.service.js":27,"./services/ami.service.js":28,"./services/dataGathering.service.js":29,"./services/faq.service.js":30,"./services/gameData.service.js":31,"./services/genre.service.js":32,"./services/retry.service.js":33,"./services/user.service.js":34,"./services/zuora.service.js":35}],26:[function(require,module,exports){
function abtestService ($cookies, gatheringSvc, $templateCache) {
    var runningAbtests = [];
    //NEXT ABTEST NUMBER
    //////////////
    //     3    //
    //////////////

    //Example test
    /*
        Version: 1, Variants: 2
        Description: Testing if removing hero image on game page generates more plays.
        Changes: Replacing "gamepageView.html".
     */
    //runningAbtests.push({version: 1, variant: 0});
    //runningAbtests.push({version: 1, variant: 1});
    //runningAbtests.push({version: 1, variant: 2});
    //End of example test

    ///////////////////////Running tests, only have running tests here..///////////////////////////

    /*
     Version: 2, Variants: 3
     Description: Testing different ways of showing how to download.
     Changes:
     - Logic in AMI service
     - abtest/installAmiInstructions-2-3.html
     - images/arrow.png
     - /libs/angular-libs.min.js added arrowjs
     - /styles/less/main_member.less #arrow-*
     */
    runningAbtests.push({version: 2, variant: 0}); //Vanilla
    runningAbtests.push({version: 2, variant: 1}); //Arrow pointing to download
    runningAbtests.push({version: 2, variant: 2}); //Screenshots in popup

    function activateTemplateTests(abtest){
        //Example test
        /*
            if(abtest.version === 1){
                if(abtest.variant === 1){
                    $templateCache.put('gamepageView.html', $templateCache.get('abtests/gamepageView-1-1.html'));
                } else if(abtest.variant === 2){
                    $templateCache.put('gamepageView.html', $templateCache.get('abtests/gamepageView-1-2.html'));
                }
            }
         */
        //End of example test
        if(abtest.version === 2 && abtest.variant === 2) {
            $templateCache.put('popups/installAmiInstructions.html', $templateCache.get('abtest/installAmiInstructions-2-2.html'));
        }
    }


    function setNewAbtest(){
        //Check if there are any test active, or return default.
        //We don't set cookie because on page reload we want to check again.
        if(runningAbtests.length === 0){
            return {version: -1, variant: -1};
        }
        var randomAbtest = runningAbtests[Math.floor(Math.random() * runningAbtests.length)];
        $cookies.put('abtest', JSON.stringify(randomAbtest),
            {path: '/', expires: new Date((new Date()).getTime() + (30 * 86400000))}); //30 days
        return randomAbtest;
    }

    function isAbtestActive(abtest){
        var isRunning = false;
        for(var i in runningAbtests)
        {
            //Try to check if this abtest is running, ignore if incorrect data was passed and default.
            try{
                if(abtest.version === runningAbtests[i].version &&
                    abtest.variant === runningAbtests[i].variant){
                    isRunning = true;
                    break;
                }
            }catch(e){
                gatheringSvc.sendErrorInfo('abtest-isAbtestActive', 'Invalid abtest passed.');
            }
        }
        return isRunning;
    }

    var initialize = function() {
        var abtest;
        var abtestCookieValue = $cookies.get('abtest');
        //Try retrieving abtest from cookie, but if fails set new one.
        try {
            var abtestCookie = JSON.parse(abtestCookieValue);
            if(abtestCookie.hasOwnProperty('version') &&
                abtestCookie.hasOwnProperty('variant') &&
                isAbtestActive(abtestCookie)){
                abtest = abtestCookie;
            } else {
                abtest = setNewAbtest();
            }
        } catch (e) {
            //Check if we need to set a new abtest
            abtest = setNewAbtest();
            gatheringSvc.sendErrorInfo('abtest-initialize', 'Invalid abtest in cookie.');
        }
        activateTemplateTests(abtest);
        return abtest;
    };

    return {
        initialize: initialize
    }
}

abtestService.$inject = ['$cookies', 'gatheringSvc', '$templateCache'];
module.exports = abtestService;
},{}],27:[function(require,module,exports){
function AccountService ($http, $q, retryService) {



    // Cache the first name so you do not need to refresh account details every time
    var cachedName = null;

    var saveCachedName = function (response) {

        cachedName = response.data.name;

        // Return the same Angular Promise as we got as argument
        return response;
    };


    // Format errors for use in forms
    var getErrors = function (response) {
        // Errors per field, the field name will be the key
        var errors = {};

        if (response.data && response.data.length) {
            response.data.forEach(function (error) {
                if (!error.field || !error.message) {
                    return;
                }

                // Add to exisiting field
                if (errors.hasOwnProperty(error.field)) {
                    errors[error.field] += ' – ' + error.message;
                }

                // Set a new error message for this field
                else {
                    errors[error.field] = error.message;
                }
            });
        }

        return errors;
    };

    // Create account details
    // After that what is returned can be used as Angular Promise

    var createAccount = function (signup) {
        var url, data;

        url = '/csi/signup';
        data = {
            emailAddress: signup.emailAddress,
            deviceId: signup.deviceId,
            password: signup.password,
            redirectUrl: signup.redirectUrl
        };

        return $http.post(url, data);
    }

    // Fetch account details, then save the first name
    // After that what is returned can be used as Angular Promise
    var getAccount = function () {
        var promise = retryService.retry(function () {
            return $http.get('/myaccount/api/player');
        });

        return promise.then(saveCachedName);
    };


    // Get the name, from cache
    // Or as fallback via the fetch of account details
    // Returns an Angular Promise
    var getName = function () {
        if (cachedName) {
            return $q.resolve(cachedName);
        }

        return getAccount().then(function () {
            // cachedName is now set by getAccount
            // When you return it, it will be the argument of the callback
            // so `.getName().then(function (name) {})`
            // will have `cachedName` as `name`-argument.
            return cachedName;
        });
    };



    // Set account details
    // Returns an Angular Promise
    var setAccount = function (account) {
        var url, data;

        url = '/myaccount/api/player';
        data = {
              emailAddress: account.emailAddress,
              name: account.name,
              phoneNumber: account.phoneNumber
        };

        return $http.post(url, data);
    };


    // Change the password
    // Returns an Angular Promise
    var changePassword = function (changePassword) {
        var url, data;

        url = '/myaccount/api/password';
        data = {
              oldPassword: changePassword.oldPassword,
              password: changePassword.newPassword
        };
        
        return $http.post(url, data);
    };


    var getEntitlement = function () {
        return retryService.retry(function () {
            return $http.get('/myaccount/api/entitlement');
        });
    };



    // Expose parts of this scope to the Angular Controllers/Directives etc
    return {
        getErrors: getErrors,
        getName: getName,
        createAccount: createAccount,
        getAccount: getAccount,
        setAccount: setAccount,
        changePassword: changePassword,
        getEntitlement: getEntitlement
    };

};



AccountService.$inject = ['$http', '$q', 'retryService'];
module.exports = AccountService;
},{}],28:[function(require,module,exports){
function AmiSvc ($rootScope, $http, gatheringSvc, $timeout, $modal, $modalStack, $analytics, $location, stBlurredDialog, gameDataSvc) {
    var installerUrl = "http://games-dl.gamehouse.com/gamehouse/activemark/aminstantservice/GameHouse_GamePlayer.exe";
    var AMIWaiter;
    var totalTrialTime = 3600;
    var minTrialTime = 30;

    aminstant.ready(function (){
        $rootScope.deviceId = aminstant.device_id;
        $rootScope.hasAMI = true;

        //BEGIN: TEMP AMI UPGRADE CODE
        var is800 = (aminstant.service_version.indexOf ('v8.00.') > 0);
        var is810 = (aminstant.service_version.indexOf ('v8.10.') > 0);
        var is820 = (aminstant.service_version.indexOf ('v8.20.') > 0);
        var is830 = (aminstant.service_version.indexOf ('v8.30.') > 0);

        // is it an old version?
        if (is800 || is810 || is820 || is830) {
            $rootScope.hasAMI = false;
            modalIsOpen = true;
            $rootScope.currentModal = $modal.open({
                templateUrl: 'amiUpgrade.html',
                size: 'sm',
                backdrop: 'static',
                keyboard: false,
            });
            $rootScope.currentModal.result.then(function () {
            }, function () {
                modalIsOpen = false;
            });
            gatheringSvc.sendBiAmiInfo('Update-starting');

            // force the autoupgrade
            var org_api_version = aminstant.api_version;
            aminstant.api_version = 'v2';
            aminstant.serviceQuery ("init", {}, aminstant.onInit);
            aminstant.api_version = org_api_version;

            clearInterval(AMIWaiter);
            AMIWaiter = setInterval(function(){ waitForAMIUpgrade(); }, 2000);
        } else {
            //Check for running installations after a refresh.
            aminstant.onInstallationProgress(null, 1000, updateInstallationProgress);
        }
    });

    function waitForAMIUpgrade(){
        aminstant._initialized = false;
        aminstant.serviceQuery ("init", {}, aminstant.onInit);
        aminstant.serviceQuery ("init", { "api_port" : 27021 }, aminstant.onInit);

        if(aminstant.isServiceInstalled()){
            var is800 = (aminstant.service_version.indexOf ('v8.00.') > 0);
            var is810 = (aminstant.service_version.indexOf ('v8.10.') > 0);
            var is820 = (aminstant.service_version.indexOf ('v8.20.') > 0);
            var is830 = (aminstant.service_version.indexOf ('v8.30.') > 0);

            if(!is800 && !is810 && !is820 && !is830){
                $rootScope.hasAMI = true;
                clearInterval(AMIWaiter);
                $modalStack.dismissAll();
                gatheringSvc.sendBiAmiInfo('Update-finished');
            }
        }
    }
    //END: TEMP AMI UPGRADE CODE

    /*  <<<<<<<<<<<<< AMI INSTALLATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
    
    //show dialog box for installing
    function installAmi(contentId){
        stBlurredDialog.close();
        $rootScope.installAmiCall = function(reDownload){
            installAmi(contentId);
            $analytics.eventTrack('click', {  category: 'InstallAmi', label: 'ClickInstallAmi' });
            dataLayer.push({
                'event': 'downloadInstaller',
                'pageUrl': $location.absUrl()
            });
            if(reDownload){
                gatheringSvc.sendBiAmiInfo('click-downloadNotStarted');
            } else {
                gatheringSvc.sendBiAmiInfo('click-download');
            }

        };
        $rootScope.amiModalGameContentId = contentId;
        stBlurredDialog.open('popups/installAmiInstructions.html');

        if($rootScope.abtest.version === 2 && $rootScope.abtest.variant === 1) {
            //Download arrow will be triggered
            Arrow.show();
        }
        //IE blocks the rendering of the modal when opening a download...
        setTimeout(function() { window.open(installerUrl, '_self') }, 750);

        clearInterval(AMIWaiter);
        AMIWaiter = setInterval(function(){ waitForAMIInstallationAndShowModal(contentId); }, 500);
        gatheringSvc.sendBiAmiInfo('show-installAmiInstructions');
    }

    function waitForAMIInstallationAndShowModal(contentId){
        aminstant.serviceQuery ("init", {}, aminstant.onInit);
        aminstant.serviceQuery ("init", { "api_port" : 27021 }, aminstant.onInit);
        
        if(aminstant.isServiceInstalled()){
            $rootScope.hasAMI = true;
            clearInterval(AMIWaiter);
            stBlurredDialog.close();

            if(contentId) {
                playOrInstallGame(contentId);
            }
            $rootScope.closeBlurredModal = function(){
                stBlurredDialog.close();
                gatheringSvc.sendBiAmiInfo('click-closeSuccessModal');
                $analytics.eventTrack('click', {  category: 'InstallAmi', label: 'ClickCloseFinishedModal' });
                dataLayer.push({
                    'event': 'downloadInstaller',
                    'pageUrl': $location.absUrl()
                });
            };
            stBlurredDialog.open('popups/installAmiSuccess.html');
            gatheringSvc.sendBiAmiInfo('show-installAmiSuccess');
        }
    }    

    /*  <<<<<<<<<<<<< GAME PLAY/INSTALLATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    function installGame(contentId){
        $http.get(baseUrlNoContext + "/member/api/games/downloaddetails.json?amcontentid=" + contentId).success(function(data){
            if(data.result === 'error'){
                removeGameFromGameManager(contentId);
                gatheringSvc.sendErrorInfo('Game-install-downloaddetails', contentId + ' Error: ' + JSON.stringify(data));
                return;
            }

            downloadManager.updateGame(contentId, 'trackingCode', data.tracking);
            aminstant.install(data, function (response) {
                if (response.error !== null) {
                    removeGameFromGameManager(contentId);
                    gatheringSvc.sendErrorInfo('Game-install', contentId + ' Error: ' + response.error);
                    gatheringSvc.sendBiDownloadGameInfo($rootScope.gameManager.sessionGamesByContentId[contentId].id, downloadManager.getGameValue(contentId, 'trackingCode'), 'error');
                } else {
                    aminstant.onInstallationProgress(contentId, 1000, updateInstallationProgress);
                    gatheringSvc.sendBiDownloadGameInfo($rootScope.gameManager.sessionGamesByContentId[contentId].id, downloadManager.getGameValue(contentId, 'trackingCode'), 'start');
                }
            });
        }).error(function(data) {
            removeGameFromGameManager(contentId);
            gatheringSvc.sendErrorInfo('Game-install-downloaddetails', contentId + ' Error: ' + JSON.stringify(data));
        });
    }


    function playOrInstallGame(contentId){
        //Show loader to give feedback response.
        downloadManager.updateGame(contentId, 'showLoader', true);
        $rootScope.gameManager.autoStartGame = '';
        aminstant.listGames(true, function (result) {
            if (result.error == null) {
                var selectedGame;
                for(var j = 0; j < result.games.length; j++){
                    var tempGame = result.games[j];
                    if(tempGame.content_id == contentId){
                        selectedGame = tempGame;
                        break;
                    }
                }

                if(isTrial() &&
                    selectedGame &&
                    ((totalTrialTime - parseInt(selectedGame.stats.total_execution_trial_time)) < minTrialTime)){
                    prepareExpiredTrialRecommendations(contentId,false, false);
                    removeGameFromGameManager(contentId);
                    //Show game trial ended notification.
                    $rootScope.amiModalGameContentId = contentId;
                    $rootScope.postTrialContentId = contentId;
                    stBlurredDialog.open('popups/endOfTrialTime.html');
                    gatheringSvc.sendBiPageVisitInfo('popups/endOfTrialTime.html');
                    return;
                }

                aminstant.play (contentId, getAuthToken(), getPlayerId(),
                    $rootScope.gameManager.sessionGamesByContentId[contentId].id,
                    isTrial(), function (response) {

                        if (response.error !== null) {
                            //- Add the game to the queue to get downloaded
                            downloadManager.addGameToDownloadQueue(contentId);
                            if(response.error !== "cannot_execute_application"){
                                gatheringSvc.sendErrorInfo('Game-play', contentId + ' Error: ' + response.error);
                            }
                        } else {

                            if(isTrial()){
                                //Retrieve recommendated games and preload them.
                                prepareExpiredTrialRecommendations(contentId,true, true);
                                aminstant.onPlayFinished(contentId, function (res) {
                                    //Always stop the preload after finishing a game.
                                    stopAllGamePreloads();
                                    if (res.error != null) {
                                        gatheringSvc.sendErrorInfo('Game-play', contentId + ' Error showing after trial popup: ' + res.error);
                                    } else {
                                        if ((totalTrialTime - res.total_execution_trial_time) < minTrialTime){
                                            //Show game trial ended notification.
                                            $rootScope.amiModalGameContentId = contentId;
                                            $rootScope.postTrialContentId = contentId;
                                            stBlurredDialog.open('popups/endOfHourTrial.html');
                                            gatheringSvc.sendBiPageVisitInfo('popups/endOfHourTrial.html');
                                        }
                                    }
                                });
                            }

                            $modalStack.dismissAll();
                            $rootScope.gameManager.autoStartGame = '';

                            $rootScope.$apply();
                            //Show loader of game starting.
                            showPlayGameLoader(contentId);
                            doPlayTracking(contentId);
                        }
                    });
            } else {
                removeGameFromGameManager(contentId);
                gatheringSvc.sendErrorInfo('Game-play', contentId + ' Error: ' + result.error);
            }
        });
    }

    function updateInstallationProgress(response){
        var installations = response.installations;
        for (var i = 0; i < installations.length; i++) {
            var game = installations[i];
            var contentId = game.content_id;

            if(game.status === 'completed'){

                if(downloadManager.getGameValue(contentId, 'gameLoading')){
                    gatheringSvc.sendBiDownloadGameInfo($rootScope.gameManager.sessionGamesByContentId[contentId].id, downloadManager.getGameValue(contentId, 'trackingCode'), 'completed');
                }

                //Only show window if the game was actually completed during this pageload.
                if($rootScope.gameManager.sessionGamesByContentId[contentId] && !game.is_preload ){
                    $rootScope.showGameManagerInWindow(true);
                }

                downloadManager.updateGame(contentId, 'installProgress', 100);
                downloadManager.updateGame(contentId, 'gameLoading', false);
                downloadManager.updateGame(contentId, 'gameReady', true);
                $rootScope.$apply();
               
                if (game.content_id === $rootScope.gameManager.autoStartGame){
                    playGameAfterInstall($rootScope.gameManager.autoStartGame);
                }
            } else if(game.status === 'installing') {
                //If the game ins't currently known in the gameManager scope retrieve it from backend
                //and add it to the scope.
                if(!$rootScope.gameManager.sessionGamesByContentId[contentId] && !game.is_preload ){
                    insertGameByContentId(contentId);
                    $rootScope.showGameManagerInWindow(true);
                }

                downloadManager.updateGame(contentId, 'showLoader', false);
                downloadManager.updateGame(contentId, 'gameLoading', true);
                downloadManager.updateGame(contentId, 'installProgress', parseFloat(game.progress));
                $rootScope.$apply();
            } else if(game.status === 'failed'){
                downloadManager.deleteGame(contentId);
                
                //uninstall to not obstruct install/throw errors next time the game is installed
                aminstant.uninstall(contentId);
                //--
                
                $rootScope.$apply();
                gatheringSvc.sendErrorInfo('Game-installListener', contentId + ' Error: ' + game.status);
            }
        }
    }
    
    function playGameAfterInstall(contentId) {
        $rootScope.gameManager.autoStartGame = '';
        aminstant.play (contentId, getAuthToken(), getPlayerId(),
            $rootScope.gameManager.sessionGamesByContentId[contentId].id,
            isTrial(), function (response) {

            if (response.error !== null) {
                    gatheringSvc.sendErrorInfo('Game-playAfterInstall', contentId + ' Error: ' + response.error);
            } else {
                if(isTrial()){
                    //Retrieve recommendated games and preload them.
                    prepareExpiredTrialRecommendations(contentId,true, true);
                    aminstant.onPlayFinished(contentId, function (res) {
                        //Always stop the preload after finishing a game.
                        stopAllGamePreloads();
                        if (res.error != null) {
                            gatheringSvc.sendErrorInfo('Game-play', contentId + ' Error showing after trial popup: ' + res.error);
                        } else {
                            if ((totalTrialTime - res.total_execution_trial_time) < minTrialTime){
                                //Show game trial ended notification.
                                $rootScope.amiModalGameContentId = contentId;
                                $rootScope.postTrialContentId = contentId;
                                stBlurredDialog.open('popups/endOfHourTrial.html');
                                gatheringSvc.sendBiPageVisitInfo('popups/endOfHourTrial.html');
                            }
                        }
                    });
                }                
            }
        });
        
        $modalStack.dismissAll();
        showPlayGameLoader(contentId);
        doPlayTracking(contentId);
    }

    /*  <<<<<<<<<<<<< Helping functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    function showPlayGameLoader(contentId){
        downloadManager.updateGame(contentId, 'showLoader', true);
        $rootScope.$apply();
        setTimeout(function(){
            downloadManager.deleteGame(contentId);
            downloadManager.updateGame(contentId, 'gameStarted', false);
            downloadManager.updateGame(contentId, 'showLoader', false);
            downloadManager.updateGame(contentId, 'gameLoading', false);
            downloadManager.updateGame(contentId, 'installProgress', 0);
            $rootScope.$apply();
        }, 20000);
    }

    /*
     * Reset the buttons and remove the game from the Q
     */
    function removeGameFromGameManager(contentId){
        //Something went wrong, at least continue with the other games.
        downloadManager.deleteGame(contentId);

        setTimeout(function(){
            downloadManager.updateGame(contentId, 'gameStarted', false);
            downloadManager.updateGame(contentId, 'showLoader', false);
            downloadManager.updateGame(contentId, 'gameLoading', false);
            downloadManager.updateGame(contentId, 'installProgress', 0);
            $rootScope.$apply();
        }, 1000);
    }

    /*  <<<<<<<<<<<<< EXTRA FUNCTIONALITY >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    function prepareExpiredTrialRecommendations(contentId, preloading, endOfHourTrial){
        try{
            var gameId = $rootScope.gameManager.sessionGamesByContentId[contentId].id;
            gameDataSvc.getGameBasedRecommendations(gameId, 2).success(function(data){
                if (data.gameList.length == 2) {
                        if(endOfHourTrial){
                            $rootScope.gameManager.recommendedGamesEndOfHourTrial = data.gameList;
                        } else {
                            $rootScope.gameManager.recommendedGames = data.gameList;
                        }
                        if(preloading){
                            for(var i in data.gameList){
                                startGamePreload(data.gameList[i]);
                            }
                        }
                } else {
                    //Fallback because we had to little recommendations.
                    gameDataSvc.getRecommendedGames(2).success(function(data){
                        if(endOfHourTrial){
                            $rootScope.gameManager.recommendedGamesEndOfHourTrial = data.gameList;
                        } else {
                            $rootScope.gameManager.recommendedGames = data.gameList;
                        }
                        if(preloading){
                            for(var i in data.gameList){
                                startGamePreload(data.gameList[i]);
                            }
                        }
                    });
                }
            });
        }catch(e){}
    }

    /*  <<<<<<<<<<<<< TRACKING >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
    
    function doPlayTracking(contentId) {
        aminstant.listGames (function (data) {
            var installations = data.games;
            for (var i = 0; i < installations.length; i++) {
               if(installations[i].content_id === contentId){
                   gatheringSvc.sendBiPlayGameInfo($rootScope.gameManager.sessionGamesByContentId[contentId].id, installations[i].tracking);
                   break;
               }
            }
        });
    }

    /*  <<<<<<<<<<<<< PRIVATE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

    function getAuthToken() {
        if($rootScope.player === undefined || $rootScope.player.userName === undefined){
            return 'unknown';
        }
        return $rootScope.player.userName;
    }

    function getPlayerId() {
        if($rootScope.player === undefined || $rootScope.player.userId === undefined){
            return -1;
        }
        return $rootScope.player.userId;
    }

    function isTrial() {
        if($rootScope.player === undefined || !$rootScope.player.isEntitled){
            return true;
        }
        return false;
    }

    function insertGameByContentId(contentId){
        gameDataSvc.getSpecificGameByContentId(contentId).success(function(data){
            if (data && data.contentId && data.id) {
                downloadManager.insertGame(data);
            }
        });
    }

    function startGamePreload(game) {
        $http.get(baseUrlNoContext + "/member/api/games/downloaddetails.json?amcontentid=" + game.contentId).success(function (data) {
            if(data.result === 'error'){
                gatheringSvc.sendErrorInfo('Game-preload-downloaddetails', game.contentId + ' Error: ' + JSON.stringify(data));
                return;
            }

            data.play_likelihood = 30;
            aminstant.preload(data, function (response) {
                if (response.error !== null && response.error !== "game_already_installed") {
                    gatheringSvc.sendErrorInfo('Game-preload-start', game.contentId + ' Error: ' + response.error);
                } else {
                    gatheringSvc.sendBiDownloadGameInfo(game.id, data.tracking, 'preload-start');
                }
            });
        });
    }

    function stopAllGamePreloads() {
        // also make sure that the preloading game hasn't finished preloading yet
        aminstant.listInstallations(function (response) {
            if (response.error !== null) {
                gatheringSvc.sendErrorInfo('Game-preload-listInstallations', ' Error: ' + response.error);
            } else {
                var installations = response.installations;
                for (var i = 0; i < installations.length; i++) {
                    if (installations[i].is_preload && installations[i].status === "installing") {
                        // found the game that is preloading and it hasn't finished, so we can safely stop the preloading
                        //rfs is dummy url to keep it happy.
                        var preloadGameData = {
                            content_id: installations[i].content_id,
                            play_likelihood: 0,
                            rfs: 'http://www.gamehouse.com'
                        };
                        aminstant.preload(preloadGameData, function (response) {
                            if (response.error !== null) {
                                gatheringSvc.sendErrorInfo('Game-preload-stop', installations[i].content_id + ' Error: ' + response.error);
                            }
                        });
                    }
                }
            }
        });
    }

    /*  <<<<<<<<<<<<< DOWNLOAD MANAGER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
    var downloadManager = (function() {
        function insertGame(game){
            $rootScope.gameManager.sessionGamesById[game.id] = game;
            $rootScope.gameManager.sessionGamesByContentId[game.contentId] = game;
            if (!$rootScope.gameManager.sessionGamesInfo[game.contentId]) {
                var tempGame = {};
                tempGame['gameStarted'] = false;
                tempGame['showLoader'] = false;
                tempGame['gameLoading'] = false;
                tempGame['installProgress'] = 0;
                tempGame['gameReady'] = false;
                tempGame['functionalId'] = game.seoName;
                tempGame['contentId'] = game.contentId;
                tempGame['trackingCode'] = '';
                tempGame['gameInfo'] = game;
                $rootScope.gameManager.sessionGamesInfo[game.contentId] = tempGame;
            }
        }

        function addGameToDownloadQueue(contentId){
            downloadQueueManager.addToQueue(contentId);
            $rootScope.gameManager.downloadManagerCount ++;
            $rootScope.showGameManagerInWindow(true);
            $rootScope.$apply();
        }

        function updateGame(contentId, status, value) {
            if ($rootScope.gameManager.sessionGamesInfo[contentId]) {
                $rootScope.gameManager.sessionGamesInfo[contentId][status] = value;
                
                if (status === 'installProgress' && value >= 100) {
                    downloadQueueManager.deleteFromQueue(contentId);
                }
            }
        }
        function deleteGame(contentId) {
            if ($rootScope.gameManager.sessionGamesInfo[contentId]) {
                downloadQueueManager.deleteFromQueue(contentId);
                delete $rootScope.gameManager.sessionGamesInfo[contentId];
            }
        }
        function getGameValue(contentId, status) {
            if ($rootScope.gameManager.sessionGamesInfo[contentId] &&
                $rootScope.gameManager.sessionGamesInfo[contentId][status]) {
                return $rootScope.gameManager.sessionGamesInfo[contentId][status];
            }
            return '';
        }
        function getGameInfoValue(contentId, status) {
            if ($rootScope.gameManager.sessionGamesInfo[contentId] &&
                $rootScope.gameManager.sessionGamesInfo[contentId].gameInfo &&
                $rootScope.gameManager.sessionGamesInfo[contentId].gameInfo[status]){
                return $rootScope.gameManager.sessionGamesInfo[contentId].gameInfo[status];
            }
            return '';
        }

        var downloadQueueManager = (function() {
            var currentDownload = 0;
            function addToQueue(contentId){
                $rootScope.gameManager.downloadQueue.push(contentId);
                $rootScope.gameManager.autoStartGame = contentId;
                if(currentDownload === 0){
                    currentDownload = contentId;
                    installGame(contentId);
                }
            }
            function deleteFromQueue(contentId){
                if($rootScope.gameManager.downloadQueue.indexOf(contentId) !== -1){
                    $rootScope.gameManager.downloadQueue.splice(contentId,1);
                    $rootScope.gameManager.downloadManagerCount --;
                    if($rootScope.gameManager.downloadQueue.length !== 0){
                        installGame($rootScope.gameManager.downloadQueue[0]);
                    } else {
                        currentDownload = 0;
                    }
                }
            }
            
            return {
                addToQueue: addToQueue,
                deleteFromQueue: deleteFromQueue
            };
        })();

        return {
            insertGame: insertGame,
            addGameToDownloadQueue: addGameToDownloadQueue,
            updateGame: updateGame,
            deleteGame: deleteGame,
            getGameValue: getGameValue,
            getGameInfoValue: getGameInfoValue
        };
    })();
    
    
    /*  <<<<<<<<<<<<< PUBLIC FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
    return {
        startGame: function (game){
            if((typeof game != 'object') || !('contentId' in game) || !('id' in  game)){
                gatheringSvc.sendErrorInfo('startGame', 'Error: Invalid game object.');
                return;
            }
            downloadManager.insertGame(game);

            if(!$rootScope.hasAMI){
                installAmi(game.contentId);
            } else {              
                playOrInstallGame(game.contentId);
            }
        },
        startGamePreload: function (game) {
            startGamePreload(game);
        },
        stopAllGamePreloads: function () {
            stopAllGamePreloads();
        }
    }
}



AmiSvc.$inject = ['$rootScope', '$http', 'gatheringSvc', '$timeout', '$modal', '$modalStack', '$analytics', '$location', 'stBlurredDialog', 'gameDataSvc'];
module.exports = AmiSvc;
},{}],29:[function(require,module,exports){
function gatheringSvc ($http, $location, $rootScope, userSvc, $cookies) {

    function getCookieValue(cookieName){
        if($cookies.get(cookieName) !== undefined){
            return $cookies.get(cookieName);
        }
        return '';
    }

    function addDefaultInfo(data){
        if($rootScope.player){
            data.playerId = $rootScope.player.userId;
            data.userName = $rootScope.player.userName;
            data.emailAddress = $rootScope.player.email;
            data.isLoggedIn = $rootScope.player.isLoggedIn;
            data.isEntitled = $rootScope.player.isEntitled;
        }
        if($rootScope.abtest){
            data.abtestversion = $rootScope.abtest.version;
            data.abtestvariant = $rootScope.abtest.variant;
        }
        data.deviceId = $rootScope.deviceId;
        data.visitorId = getCookieValue('ghvid');
        data.sessionId = getCookieValue('ghsid');
        data.utmsource = getCookieValue('utmsource');
        data.utmmedium = getCookieValue('utmmedium');
        data.utmcampaign = getCookieValue('utmcampaign');
        data.utmcontent = getCookieValue('utmcontent');
        data.utmterm = getCookieValue('utmterm');

    }

    return {
        sendBiPageVisitInfo: function(pageUrl) {
            var data = {
                logname: 'pageView',
                pageUrl: (pageUrl ? pageUrl : $location.absUrl())
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendBiAmiInfo: function(status) {                          
            var data = {
                logname: 'installAmi',
                status: status
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendBiDownloadGameInfo: function(gameId, trackingCode, status) {
            var data = {
                logname: 'downloadGame',
                gameId: gameId,
                trackingCode: trackingCode,
                status: status
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendBiPlayGameInfo: function(gameId, trackingCode) {
            var data = {
                logname: 'playGame',
                gameId: gameId,
                trackingCode: trackingCode
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendBiSearchInfo: function(searchTerm, amountOfResults, source) {
            var data = {
                logname: 'searchGames',
                searchterm: searchTerm,
                amount: amountOfResults,
                // source: "searchbar" or "showall"
                source: source
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendNpsInfo: function(userId, npsScore) {
            var data = {
                logname: 'nps',
                npsid: userId + '-' + new Date().getTime(),
                score: npsScore
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendNpsCommentInfo: function(userId, npsScore, npsComment) {
            var data = {
                logname: 'npsComment',
                npsid: userId + '-' + new Date().getTime(),
                score: npsScore,
                comment: npsComment
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendErrorInfo: function(location, error) {
            var data = {
                logname: 'error',
                location: location,
                error: error
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendCreateAccountSuccess: function() {
            var data = {
                logname: 'createAccountSuccess'
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendCreateAccountSubmitError: function(email, emailValid, passwordValid) {
            var data = {
                logname: 'createAccountSubmitError',
                email: email,
                emailvalid: emailValid,
                passwordvalid: passwordValid
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendCreateAccountError: function(email, errorMessage) {
            var data = {
                logname: 'createAccountError',
                email: email,
                errormessage: JSON.stringify(errorMessage)
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        },
        sendExtendedPlayerDetails: function() {
            var data = {
                logname: 'extendedPlayerDetails',
                screenwidth: screen.width,
                screenheight: screen.height,
                viewportwidth: document.documentElement.clientWidth,
                viewportheight: document.documentElement.clientHeight,
                useragent: navigator.userAgent
            };
            addDefaultInfo(data);
            userSvc.checkSessionId().then(function(){
                return $http.post(gatheringEndpoint, data);
            });
        }

    };
};


gatheringSvc.$inject = ['$http', '$location', '$rootScope', 'userSvc', '$cookies'];
module.exports = gatheringSvc;
},{}],30:[function(require,module,exports){
function faqService ($http) {
   var getAllQuestionCategories = function() {
       var url = baseUrlNoContext + '/member/api/faq/getall.json';
       return $http.get(url);
    };

    return {
        getAllQuestionCategories: getAllQuestionCategories
    }
}

faqService.$inject = ['$http'];
module.exports = faqService;
},{}],31:[function(require,module,exports){
function GameDataSvc ($q, $http, $rootScope) {
    $rootScope.cancelRequest = $q.defer();

    return {
        //----------------
        //Cancel request call
        cancelRequest: function(){
            $rootScope.cancelRequest.resolve();
            $rootScope.cancelRequest = $q.defer();
        },
        
        //----------------
        //Search box calls
        getAllGames: function() {
            var url = baseUrlNoContext + '/member/api/games/search-all-select.json';
            return $http.get(url);
        },
        getSearchedGames: function(query) {
            var url = baseUrlNoContext + '/member/api/search?q=' + query;
            return $http.get(url);
        },
        
        //----------------
        //Get Games calls
        getAllCategories: function() {
            var url = baseUrlNoContext + '/member/api/categories/all.json?type=categorybox';
            return $http.get(url);
        },
        getRecentGames: function(amount){
            var url = baseUrlNoContext + '/member/api/games/recentlyplayed-select.json?amount=' + amount;
            return $http.get(url, {timeout: 8000});
        },
        getAllRecentGames: function(){
            var url = baseUrlNoContext + '/member/api/games/recentlyplayed-all-select.json';
            return $http.get(url, {timeout: 8000});
        },

        getNewGames: function(pageCount, gamesPerPage) {
            // pageCount is zero-based
            var url = baseUrlNoContext + '/member/api/games/new-select.json?start=' + pageCount + '&count=' + gamesPerPage;
            return $http.get(url);
        },
        getRecommendedBecauseYouPlayedGames: function(amount) {
            var url = baseUrlNoContext + '/member/api/games/recommendation-because-select.json?amount=' + amount;
            return $http.get(url);
        },
        getRecommendedGames: function(amount) {
            var url = baseUrlNoContext + '/member/api/games/recommendation-select.json?amount=' + amount;
            return $http.get(url, {timeout: 8000});
        },
        getTopRatedGames: function(pageCount, gamesPerPage) {
            // pageCount is zero-based
            var url = baseUrlNoContext + '/member/api/games/toprated-select.json?start=' + pageCount + '&count=' + gamesPerPage;
            return $http.get(url);
        },
        getCategoryGames: function(key, pageCount, gamesPerPage) {
            // pageCount is zero-based
            var url = baseUrlNoContext + '/member/api/games/category-select.json?categoryname=' + key + '&start=' + pageCount + '&count=' + gamesPerPage + '&sortby=launchdate';
            return $http.get(url);
        },

        //---------------
        //Game page calls
        getSpecificGame: function(seoName) {
            var url = baseUrlNoContext + '/member/api/games/gamepage-select.json?seoName=' + seoName;
            return $http.get(url);
        },
        getGameBasedRecommendations: function (gameId, amount) {
            var url = baseUrlNoContext + '/member/api/games/recommendation-item-select.json?amount='+ amount + '&gameId=' + gameId;
            return $http.get(url, {timeout: 8000});
        },

        // Post (new) game rating
        postGameRating: function(gameId, ratingObject) {
            try {
                var url = baseUrlNoContext + '/member/api/games/rategame.json?gameId=' + gameId;
                return $http.post(url, ratingObject);
            }
            catch (e) {
                return false;
            }
        },

        //---------------
        //Global specific game calls
        getSpecificGameByContentId: function(contentId) {
            var url = baseUrlNoContext + '/member/api/games/game-select.json?contentId=' + contentId;
            return $http.get(url);
        }
    };
}


GameDataSvc.$inject = ['$q', '$http', '$rootScope'];
module.exports = GameDataSvc;
},{}],32:[function(require,module,exports){
function GenreService ($q, $http) {

    var cachedGenreDetails = null;


    // Store genre details in a variable cache
    var saveGenreDetails = function (response) {
        cachedGenreDetails = response.data;
        return cachedGenreDetails;
    }


    var getGenreDetails = function () {
        if (cachedGenreDetails) {
                return $q.resolve(cachedGenreDetails);
        }
        
        return $http.get('/member/api/categories/all.json').then(saveGenreDetails);
    };


    return {
        getGenreDetails: getGenreDetails
    }

}




GenreService.$inject = ['$q', '$http'];
module.exports = GenreService;
},{}],33:[function(require,module,exports){
// Retry Service
//
// Example use:
//
// var promise = retryService.retry(function () {
//     return $http.get(url);
// });
//
// Make sure to return an Angular Promise at the exit of the function
//
// now use `promise.then()` etc
// as if you'd use the `.then()` on the `.get()` or so
//
// Settings:
// retryService.retry(function () { .. }, {
//     delay: 250,
//     retries: 5
// });
var RetryService = function ($q, $timeout) {

    var defaultConfig = {
        delay: 250,
        retries: 5
    };
    
    var retry = function (callback, preferences) {

        // Return an Angular Promise
        // When calling `succeed`, the promise succeeds; vice versa for `fail`
        return $q(function (succeed, fail) {

            // Keep track of how many times we try the thing
            var timesTried = 0;

            var config = angular.extend({}, defaultConfig, preferences);

            // Check if we tried too many times already,
            // Else: retry within a set time
            var setRetry = function (data) {
                if (timesTried > config.retries) {
                    return fail(data);
                }

                $timeout(tryCallback, config.delay);
            };

            // Try performing our thing
            // The `callback` as passed to the `retry` function should return an Angular promise
            // Depending on success/failure of it, we can retry
            var tryCallback = function () {
                ++timesTried;
                var working = callback();
                working.then(succeed, setRetry);
            };

            // Try for the first time
            tryCallback();
        });
    };


    return {
        retry: retry
    }
};



RetryService.$inject = ['$q', '$timeout'];
module.exports = RetryService;
},{}],34:[function(require,module,exports){
function userSvc ($http, $q, $cookies) {
    function S4() {
        return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    }

    function getUUID(){
        return (S4() + S4() + "-" + S4() + "-4" + S4().substr(0,3) + "-" + S4() + "-" + S4() + S4() + S4()).toLowerCase();
    }

    function getCurrentFormattedDate(){
        var currentDate = new Date();
        var year =  currentDate.getUTCFullYear()
        var month = currentDate.getUTCMonth() + 1;
        var day = currentDate.getUTCDate();
        return year + '-' + month + '-' + day;
    }

    return {
        //
        //Get player details
        //
        getDefaultPlayer: function() {
            var player =  {
                playerName: null,
                isLoggedIn: false,
                isEntitled: false,
                userId: -1,
                userName: 'preload',
                email: '',
                deviceId: '',
                isPreloadingEnabled: false
            };
            return player;
        },
        getPlayer: function() {
            var url = baseUrlNoContext + '/member/api/player/whoami.json';
            return $http.get(url);
        },
        getPlayerByDeviceId: function(deviceId) {
            var url = baseUrlNoContext + '/member/api/player/getPlayerByDeviceId.json?deviceid=' + deviceId;
            return $http.get(url);
        },
        getPlayerBrowserOs: function() {
            var url = baseUrlNoContext + '/member/api/player/whatdoihave.json';
            return $http.get(url);
        },
        checkSessionId: function() {
            var deferred = $q.defer();
            var sessionValid = $cookies.get('ghsid') === undefined ? false : true;
            if(!sessionValid){
                var url = baseUrlNoContext + '/member/api/player/getsessionid.json';
                return $http.get(url);
            }
            deferred.resolve();
            return deferred.promise;
        },
        checkVisitorId: function() {
            if($cookies.get('ghvid') === undefined){
                //Set cookie for 25 years
                $cookies.put('ghvid',
                    getCurrentFormattedDate() + '_' + getUUID(),
                    {path: '/', expires: new Date((new Date()).getTime() + (25 * 365 * 86400000))});
            }
        },

        //
        // Support: integration with Zendesk
        //
        postZendeskTicket: function(email, userName, topic, comment, gameName, systemInformation, playerInformation) {
            try {
                var url = baseUrlNoContext + "/member/api/support/insertticket.json";
                var data = {
                    email: email.trim(),
                    topic: topic.trim(),
                    comment: comment.trim(),
                    systemInformation: systemInformation,
                    playerInformation: playerInformation,
                    name: userName.trim(),
                    gameName: gameName
                };
                return $http.post(url, data);
            }
            catch (e) {
                return false;
            }
        }
    };
};


userSvc.$inject = ['$http', '$q', '$cookies'];
module.exports = userSvc;
},{}],35:[function(require,module,exports){
var ZuoraService = function (retryService, $http, $q, $document, gatheringSvc, $rootScope) {

    //Define the type of action being performed, either subscribe or update.
    var type = null;

    // Will store payment metadata, as retrieved from our own API.
    var zuoraPaymentDetails = null;


    // These form fiels in the payment form will be prefilled
    var prefilledFormFields = {
        creditCardCountry: 'USA'
    };


    // Public method to load and render the Zuora form
    // This method will perform a few steps in a sequence:
    // Load payment metadata from our own API
    // Store that metadata
    // Dynamically load the Zuora API using the metadata
    // Start rendering the form
    // 
    // The return value is an Angular Promise
    // The promise will reject when any of the above steps fails
    // The promise will resolve only if the Zuora form started rendering
    //
    // The value of the resolve will be an object that includes
    // a `payment` Angular Promise.
    // 
    // That payment promise will respolve when succesfully submitted credit card details
    //
    // actionType indicates if this is a update or subscribe call. The result is different endpoints
    // being called after completion/error.
    // Possible values: "update", "subscribe"
    var renderPaymentForm = function (actionType) {
        var paymentDone;
        type = actionType;

        // Fetch metadata from our API
        paymentDone = getPaymentMethodDetails()
            .then(savePaymentMethod) // Store the data for later use
            .then(loadZuora) // Load the Zuora API
            .then(renderZuora) // Render the Iframe

        // Return the Angular Promise
        return paymentDone;
    };



    // Fetch the payment method details metadata from our API
    // This includes a few tokens so that we can access Zuora
    var getPaymentMethodDetails = function () {
        return retryService.retry(function () {
            return $http.get('/myaccount/api/payment/method');
        });
    };


    // Locally store the Zuora request details
    var savePaymentMethod = function (response) {
        zuoraPaymentDetails = response.data;
        return response.data;
    }


    // Insert a script tag to load Zuora-JS-API
    // Resolve Angular Promise when 
    var loadZuora = function (zuoraPaymentDetails) {
        return retryService.retry(function () {
            var deferred, scriptNode;

            // Create a deferred
            // The deferred will resolve when the Zuora API loaded completely
            // The deferred will reject when something fails
            deferred = $q.defer();

            // Dynamically create a script element
            // Set the URL to the retrieved of the Zuora API
            // Handle events such as the onload/onerror to steer the deferred
            //
            // It is better to load this API via this way to ensure players
            // will only load the Zuora API when they intend to update their payment details.
            scriptNode = $document[0].createElement('script');
            $document.find('body').append(scriptNode);

            scriptNode.addEventListener('load', function () { deferred.resolve(zuoraPaymentDetails); }, false);
            scriptNode.addEventListener('error', function () { deferred.reject('Connection error while loading Zuora JS API'); }, false);

            scriptNode.src = zuoraPaymentDetails.paymentForm.libraryUrl;

            // Return the Angular Promise, so chaining can be done for this step too
            return deferred.promise;
        });
    };


    // Zuora will call this method for every field in the payment form
    // that resulted in a validation error.
    //
    // With the key/code/message we can set custom error messages.
    var formatErrorMessage = function (key, code, message) {

        // Get the message text for ae key/code/message-combination
        var getErrorMessage = function (key, code, message) {
            if (key === 'error') {
                if (message.indexOf('declined.RespCode:27') > -1) {
                    return 'The address information you\'ve entered is incorrect. <br/>Please check all required fields and try again.';
                } else if (message.indexOf('Field [Address verification service address] exceeded max length') > -1) {
                    return 'Please abbreviate your address so it has no more than 30 characters. <br/>You can also <a href="'+baseUrlNoContext+'/member/#/contact" target="_blank">contact us</a>  for help.';
                } else if (message.indexOf('Field [Address verification service ZIP code] exceeded max length') > -1) {
                    return 'Please abbreviate your ZIP code so it has no more than 10 characters. <br/>You can also <a href="'+baseUrlNoContext+'/member/#/contact" target="_blank">contact us</a>  for help.';
                } else if (message.indexOf('Field [AVS CITY] exceeded max length') > -1) {
                    return 'Please abbreviate your city name so it has no more than 20 characters. <br/>You can also <a href="'+baseUrlNoContext+'/member/#/contact" target="_blank">contact us</a>  for help.';
                } else if (message.indexOf('Field [AVS ADDRESS] exceeded max length') > -1) {
                    return 'Please abbreviate your address 2, so it has no more than 20 characters. <br/>You can also <a href="'+baseUrlNoContext+'/member/#/contact" target="_blank">contact us</a>  for help.';
                } else if (message.indexOf('Invalid length for State') > -1) {
                    return 'Please use at least 2 characters for the state. <br/>You can also <a href="'+baseUrlNoContext+'/member/#/contact" target="_blank">contact us</a>  for help.';
                } else {
                    return 'The credit card information you\'ve entered is invalid. <br/>Please check all required fields and try again.';
                }
            }

            return message;
        }

        var errorMessage = getErrorMessage(key, code, message);
         
        // Use this function to show customized error message based on the key of the given field.
        Z.sendErrorMessageToHpm(key, errorMessage);
    }



    // Render the Zuora form
    var renderZuora = function (zuoraPaymentDetails) {

        // This deferred will resolve/reject based on succesful payment of the Zuora payment form
        var deferredPayment = $q.defer();

        // This object is the value for the Deferred's resolve.
        // In the object is promise for the payment.
        var zuoraObject = {
            payment: deferredPayment.promise
        };


        // Form has been submitted
        // Ping success/error handlers
        // Resolve Angular Promise in case of success
        // Rejcect Angular Promise in case of failure
        var formCallback = function (response) {
            var url, request;

            var paymentSuccess = function () {
                deferredPayment.resolve(response);
            };

            var paymentFailure = function () {
                $rootScope.$broadcast('notification:error', 'Something went wrong. Please try again or contact us.');
                gatheringSvc.sendErrorInfo('Payment', 'Failed callback on ' + type);
                deferredPayment.reject(response);
            };

            if (response.success) {
                // Ping to our own API when the payment was a success
                // This is a mandatory step, when subscribing a new subscription it will create it and activate it.
                // The call might fail and we should show an error.
                if(type === 'update'){
                    url = '/myaccount/api/payment/callback/' + zuoraPaymentDetails.accountNumber + '?id=' + response.refId;
                } else if(type === 'subscribe'){
                    url = '/myaccount/api/subscribe/callback/' + zuoraPaymentDetails.accountNumber + '?id=' + response.refId;
                }
                request = $http.get(url);
                request.then(paymentSuccess, paymentFailure);
            }
            else {
                // Ping to our own API so customer support can log and reach out when a payment fails
                if(type === 'update'){
                    url = '/myaccount/api/payment/callback/' + zuoraPaymentDetails.accountNumber + '/error?errorCode=' + response.errorCode + '&errorMessage=' + response.errorMessage;
                    gatheringSvc.sendErrorInfo('Payment', 'Failed updating payment details in Zuora');
                } else if(type === 'subscribe'){
                    url = '/myaccount/api/subscribe/callback/' + zuoraPaymentDetails.accountNumber + '/error?errorCode=' + response.errorCode + '&errorMessage=' + response.errorMessage;
                    gatheringSvc.sendErrorInfo('Payment', 'Failed subscribing in Zuora');
                }
                request = $http.get(url);
                request.then(paymentFailure, paymentFailure);
            }
        };

        // The Zuora API fills the variable `Z`.
        // Check if the Zuora Z object has been instantiated properly
        if (Z.renderWithErrorHandler) {
            var params = {
                tenantId: zuoraPaymentDetails.paymentForm.tenantId,
                id: zuoraPaymentDetails.paymentForm.pageId,
                token: zuoraPaymentDetails.paymentForm.token,
                signature: zuoraPaymentDetails.paymentForm.signature,
                style: 'inline',
                key: zuoraPaymentDetails.paymentForm.key,
                submitEnabled: 'true',
                locale: 'en_US',
                url: zuoraPaymentDetails.paymentForm.uri,
            };

            if (zuoraPaymentDetails.usePaymentProxy) {
                var origCreateIframeURL = Z.createIframeURL;
                Z.createIframeURL = (function () {
                    var result = origCreateIframeURL();
                    return baseUrlNoContext+'/myaccount/paymentproxy?url='+encodeURIComponent(result);
                });
            }

            Z.renderWithErrorHandler(
                params,
                prefilledFormFields,
                formCallback,
                formatErrorMessage
            );

            // The form will start to load.
            // Return with a value for the Angular Promise:
            //
            //
            return $q.resolve(zuoraObject);
        }
        else {
            return $q.reject('Zuora JS API not loaded properly.');
        }
    };


    return {
        renderPaymentForm: renderPaymentForm
    }
};



ZuoraService.$inject = ['retryService', '$http', '$q', '$document', 'gatheringSvc', '$rootScope'];
module.exports = ZuoraService;
},{}]},{},[25]);

//# sourceMappingURL=scripts.js.map
