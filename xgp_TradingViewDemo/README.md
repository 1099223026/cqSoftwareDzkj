
使用的trading文件：charting_library-master

提供datafeed后台：klinecontroller.php

demo用法：需在本地搭建服务器环境（例如：wampserver）,然后直接运行test.html文件即可

心得：在编码过程中，我们只需要编写test.html文件，其他文件不需要做改动，核心文件中已经集成了JS API和UDF，我们只需要调用具体的JS API方法便可以达到我们想要的目的，后台需要搭建好本地域名（如果跨域，请事先在代码中添加相关跨域代码，详情百度），开放接）:
step1->前台通过填写的地址访问该地址下的../config接口，得到该图表的相关配置参数，注：各个接口的访问与否都与配置参数有关（具体开放的接口与配置项可在klinecontroller.php文件中查看，这里不再赘述）；
step2->访问symbols接口;
step3->根据symbols返回的ticker参数来请求history接口，注：此时该接口会一直访问该ticker（商品）所对应的k线数据，直到页面重新加载，或者remove掉widget变量；


总体：请求后台配置-根据配置请求相应接口-再对k线数据进行自己的UDF

贴一段test.html中widget中的配置：
 widget = window.tvWidget = new TradingView.widget({
                        // 很多下面没有的参数可以在bundle.js里面找到相关的默认配置
                        fullscreen: false, // 是否全屏
                        symbol:bid, // 显示哪个标的图表
                        interval: '1', // 分组刻度
                        timeframe: '3M', // 取多久的数据
                        toolbar_bg: '#f4f7f9',
                        container_id: "tv_chart_container",
                        //	BEWARE: no trailing slash is expected in feed URL
                        datafeed: udf_datafeed,
                        library_path: "charting_library/",
                        locale: getParameterByName('lang') || "zh",
                        //	Regression Trend-related functionality is not implemented yet, so it's hidden for a while
                        drawings_access: { type: 'black', tools: [ { name: "Regression Trend" } ] },
                        disabled_features: [ // 列出的属性全部隐藏
                            "save_chart_properties_to_local_storage",
							"volume_force_overlay", // 分栏显示成交量
							'timeframes_toolbar', // 底部时间导航拦
							// 'left_toolbar', // 左边导航栏
							'header_saveload', // 上传下载图标
							// 'border_around_the_chart', // 图标四周的边框
							// 'header_fullscreen_button', // 全屏按钮
							'header_screenshot', // 快照按钮
							'header_undo_redo', // 前进后退箭头
							'header_compare', // 天枰图标
							// 'header_indicators', // 技术指标
							// 'header_settings', // 头部设置按钮
							// 'header_chart_type', // 头部k线形状
							'header_interval_dialog_button', // 时间刻度后面的...
							// 'header_resolutions', // 时间刻度
							'header_symbol_search', // 商品搜索输入框
							// 'header_widget', //整个头部导航栏

							'edit_buttons_in_legend', // 成交量视图后面的三个按钮
							'legend_context_menu', // k线图、成交量中的倒三角设置按钮
							'items_favoriting', // 禁用所有收藏按钮
							// 'side_toolbar_in_fullscreen_mode' // 全屏模式下启用工具栏
							'open_account_manager'
						],

                        enabled_features: [ // 启用特性
                            "move_logo_to_main_pane",
							"study_templates",
                            'left_toolbar'

						],

                        favorites: { // 收藏
                            // intervals: [1, 5, 10, 30, 60, 240, '1D', '5D', '1W'],
                            // chartTypes: ["Area", "Line"]
                        },
                        overrides: {// 覆盖
                            // "paneProperties.background": "#222222", //图表内容颜色改变
                            // "paneProperties.vertGridProperties.color": "#454545", // 两个参数控制x/y轴颜色
                            // "paneProperties.horzGridProperties.color": "#454545",
                            // "symbolWatermarkProperties.transparency": 90,
                            // "scalesProperties.textColor" : "#AAA",
                            // "symbolWatermarkProperties.color": "rgba(0, 0, 0, 0)"
                        },

                        debug: false,
						// 默认，尽量不要动
                        charts_storage_url: 'http://saveload.tradingview.com',
                        charts_storage_api_version: "1.1",
                        client_id: 'tradingview.com',
                        user_id: 'xgp', // public_user
                    });

                }
