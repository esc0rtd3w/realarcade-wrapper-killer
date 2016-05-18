(function(){
  'use strict';

  /**
   * @ngdoc directive
   * @name mailcheck.directive:mailcheck
   * @description
   * Angular wrapper for Mailcheck.js
   * author: https://github.com/simison
   * source: https://github.com/simison/angular-mailcheck
   * version: mailcheck v1.1.1
   */
  angular
    .module('angular-mailcheck', [])
    .directive('mailcheck', mailcheckDirective);

  mailcheckDirective.$inject = ['$compile', '$sce'];

  function mailcheckDirective($compile, $sce) {
    return {
      restrict: 'A',
      replace: false,
      link: function(scope, el, attrs) {

        // Limit to input element of specific types
        var inputTypes = /text|email/i;
        if(el[0].nodeName !== 'INPUT') {
          throw new Error('angular-mailcheck is limited to input elements');
        }
        if(!inputTypes.test(attrs.type)) {
          throw new Error('Invalid input type for angular-mailcheck: ' + attrs.type);
        }

        scope.suggestion = false;
        scope.bugmenot = false;

        // Compiled template
        var template = $compile('<div class="help-block mailcheck" ng-show="suggestion && !bugmenot">Did you mean <a ng-bind="suggestion" ng-click="useSuggestion()"></a>?</div>')(scope);
        el.after(template);

        el.bind('input', function() {
            scope.suggestion = false;
          })
          .bind('blur', function() {
            el.mailcheck({
              suggested: function(element, suggestion) {
                scope.suggestion = suggestion.full;
                scope.$apply();
              },
              empty: function(element) {
                scope.suggestion = false;
              }
            });
          });

        scope.useSuggestion = function() {
          el.val(scope.suggestion);
          scope.suggestion = false;
        };

      }
    };
  }

})();
