angular.module("app").config(["$stateProvider", "$urlRouterProvider", "$ocLazyLoadProvider", "$breadcrumbProvider",
    function($stateProvider, $urlRouterProvider, $ocLazyLoadProvider, $breadcrumbProvider) {
        $urlRouterProvider.otherwise("/dashboard");
        var time = $.now();
        $ocLazyLoadProvider.config({
            debug: false
        });
        $breadcrumbProvider.setOptions({
            prefixStateName: "app.main",
            includeAbstract: true,
            template: '<li class="breadcrumb-item" ng-repeat="step in steps" ng-class="{active: $last}" ng-switch="$last || !!step.abstract"><a ng-switch-when="false" href="{{step.ncyBreadcrumbLink}}">{{step.ncyBreadcrumbLabel}}</a><span ng-switch-when="true">{{step.ncyBreadcrumbLabel}}</span></li>'
        });
        $stateProvider.state("app", {
            abstract: true,
            templateUrl: "tpl/common/layouts/full.html",
            ncyBreadcrumb: {
                label: "Root",
                skip: true
            },
            resolve: {
                loadCSS: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["fontawesome", "simplelineicon"]);
                    }
                ],
            }
        }).state("app.main", {
            url: "/dashboard",
            templateUrl: "tpl/dashboard/dashboard.html",
            ncyBreadcrumb: {
                label: "Home"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["chart.js"]).then(() => {
                            return $ocLazyLoad.load({
                                files: ["tpl/dashboard/dashboard.js"]
                            });
                        });
                    }
                ]
            }
        }).state("app.sekolah", {
            url: "/sekolah",
            templateUrl: "tpl/m_sekolah/index.html",
            ncyBreadcrumb: {
                label: "Sekolah"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["chart.js"]).then(() => {
                            return $ocLazyLoad.load({
                                files: ["tpl/m_sekolah/index.js?time="+time]
                            });
                        });
                    }
                ]
            }
        }).state("app.ptk", {
            url: "/ptk",
            templateUrl: "tpl/m_ptk/index.html",
            ncyBreadcrumb: {
                label: "PTK"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_ptk/index.js?time="+time]
                        });
                    }
                ]
            }
        })
        .state("app.peserta_didik", {
            url: "/peserta_didik",
            templateUrl: "tpl/m_peserta_didik/index.html",
            ncyBreadcrumb: {
                label: "Peserta Didik"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_peserta_didik/index.js?time="+time]
                        });
                    }
                ]
            }
        })
        .state("app.laporan", {
            url: "/laporan-sekolah",
            templateUrl: "tpl/l_sekolah/index.html",
            ncyBreadcrumb: {
                label: "Laporan Sekolah"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["chart.js", 'daterangepicker']).then(() => {
                            return $ocLazyLoad.load({
                                files: ["tpl/l_sekolah/index.js?time=" + time]
                            });
                        });
                    }
                ]
            }
        })
        .state("master", {
            abstract: true,
            templateUrl: "tpl/common/layouts/full.html",
            ncyBreadcrumb: {
                label: "Sarpras"
            },
            resolve: {
                loadCSS: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["fontawesome", "simplelineicon", "iconflag"]);
                    }
                ],
                loadPlugin: ["$ocLazyLoad", function($ocLazyLoad) {}],
                authenticate: authenticate
            }
        })
        .state("master.tb", {
            url: "/tb",
            templateUrl: "tpl/m_tanah_bangunan/index.html?time="+time,
            ncyBreadcrumb: {
                label: "Tanah dan Bangunan"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_tanah_bangunan/index.js?time="+time]
                        });
                    }
                ]
            }
        }).state("master.ruang", {
            url: "/ruang",
            templateUrl: "tpl/m_ruang/index.html?time="+time,
            ncyBreadcrumb: {
                label: "Ruang"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_ruang/index.js?time="+time]
                        });
                    }
                ]
            }
        })
        

        .state("laporan", {
            abstract: true,
            templateUrl: "tpl/common/layouts/full.html",
            ncyBreadcrumb: {
                label: "Laporan"
            },
            resolve: {
                loadCSS: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["fontawesome", "simplelineicon", "iconflag"]);
                    }
                ],
                loadPlugin: ["$ocLazyLoad", function($ocLazyLoad) {}],
                authenticate: authenticate
            }
            
        })
        .state("pengguna", {
            abstract: true,
            templateUrl: "tpl/common/layouts/full.html",
            ncyBreadcrumb: {
                label: "User Login"
            },
            resolve: {
                loadCSS: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["fontawesome", "simplelineicon", "iconflag"]);
                    }
                ],
                loadPlugin: ["$ocLazyLoad", function($ocLazyLoad) {}],
                authenticate: authenticate
            }
        }).state("pengguna.akses", {
            url: "/hak-akses",
            templateUrl: "tpl/m_akses/index.html",
            ncyBreadcrumb: {
                label: "Hak Akses"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_akses/index.js"]
                        });
                    }
                ]
            }
        }).state("pengguna.user", {
            url: "/user",
            templateUrl: "tpl/m_user/index.html",
            ncyBreadcrumb: {
                label: "Pengguna"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_user/index.js"]
                        });
                    }
                ]
            }
        }).state("pengguna.profil", {
            url: "/profil",
            templateUrl: "tpl/m_user/profile.html",
            ncyBreadcrumb: {
                label: "Profil Pengguna"
            },
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/m_user/profile.js"]
                        });
                    }
                ]
            }
        }).state("page", {
            abstract: true,
            templateUrl: "tpl/common/layouts/blank.html",
            resolve: {
                loadCSS: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load(["fontawesome", "simplelineicon"]);
                    }
                ]
            }
        }).state("page.login", {
            url: "/login",
            templateUrl: "tpl/common/pages/login.html",
            resolve: {
                loadMyCtrl: ["$ocLazyLoad",
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ["tpl/site/login.js"]
                        });
                    }
                ]
            }
        }).state("page.404", {
            url: "/404",
            templateUrl: "tpl/common/pages/404.html"
        }).state("page.500", {
            url: "/500",
            templateUrl: "tpl/common/pages/500.html"
        });

        function authenticate($q, UserService, $state, $transitions, $location, $rootScope) {
            var deferred = $q.defer();
            if (UserService.isAuth()) {
                deferred.resolve();
                var fromState = $state;
                var globalmenu = ["page.login", "pengguna.profil", "app.main", "page.500", "app.generator"];
                $transitions.onStart({}, function($transition$) {
                    var toState = $transition$.$to();
                    if ($rootScope.user.akses[toState.name.replace(".", "_")] || globalmenu.indexOf(toState.name)) {} else {
                        $state.target("page.500")
                    }
                });
            } else {
                $location.path("/login");
            }
            return deferred.promise;
        }
    }
]);