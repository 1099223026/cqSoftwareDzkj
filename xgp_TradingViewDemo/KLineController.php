<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/27 0027
 * Time: 17:42
 */

namespace home\controllers;



use common\models\business\BBid;
use common\models\business\BCurrency;
use common\models\Setting;
use common\services\TransService;

class KLineController extends BaseController
{
    /**
     * @param $arr
     * @return string
     * info : 格式化为json格式
     */
    private function resJson($arr)
    {
        return json_encode($arr);
    }

    /**
     * @return string
     * info: config-配置
     */
    public function actionConfig()
    {
        $respondContent['exchanges'] = [
//            ["value"=>"", "name"=>"All Exchanges", "desc"=>""],
//            ["value"=>"NasdaqNM", "name"=> "NasdaqNM", "desc"=>"NasdaqNM"],
//            ["value"=>"NYSE", "name"=>"NYSE", "desc"=>"NYSE"],
//            ["value"=>"NCM", "name"=> "NCM", "desc"=> "NCM"]
        ]; // 交易所数组
        $respondContent['supported_resolutions'] = [1, 5, 10, 30, 60, 240, '1D', '5D', '1W']; // 分辨率
        $respondContent['supports_group_request'] = false;
        $respondContent['supports_marks'] = false;
        $respondContent['supports_search'] = true;// 是否支持搜索
        $respondContent['supports_time'] = true; // 是否传递一次服务器时间
        $respondContent['supports_timescale_marks'] = false;
        $respondContent['symbols_types'] = [
//            ["name"=> "All types", "value"=> ""],
//            ["name"=> "Stock", "value"=>"stock"],
//            ["name"=> "Index", "value"=> "index"]
        ];

        return $this->resJson($respondContent);
    }

    /**
     * @return string
     * info: 开启supports_group_request参数，就会调用此方法
     */
    public function actionSymbolInfo()
    {
        return 'datafeed is ok';
    }

    /**
     * @return int
     * info: 服务器当前时间
     */
    public function actionTime()
    {
        return NOW_TIME;
    }

    /**
     * @return string
     * info: symbol参数配置
     * api：https://zlq4863947.gitbooks.io/tradingview/book/Symbology.html#supportedresolutions
     */
    public function actionSymbols()
    {
        $symbol = $this->gString('symbol', 1);
        $respondContent['description'] = "Apple Inc.";
        $respondContent['exchange-listed'] = "NasdaqNM"; // 次参数开启，才会调用history方法
        $respondContent['exchange-traded'] = "NasdaqNM";
        $respondContent['has_intraday'] = true; // 屏幕可选分辨率
        $respondContent['has_no_volume'] = false; // 是否拥有成交量
        $respondContent['minmov'] = 1;
        $respondContent['minmov2'] = 0;
        $respondContent['name'] = $symbol;
        $respondContent['pointvalue'] = 1;
        $respondContent['pricescale'] = 100;
        $respondContent['session'] = "0930-1630";
        $respondContent['ticker'] = $symbol; // 该参数会直接影响k线图获取哪个标
        $respondContent['timezone'] = "America/New_York";
        $respondContent['type'] = "stock";

        return $this->resJson($respondContent);


        // old
//        $respondContent['description'] = "Apple Inc.";
//        $respondContent['exchange-listed'] = "NYSE"; // 次参数开启，才会调用history方法
//        $respondContent['exchange-traded'] = "NYSE";
//        $respondContent['has_intraday'] = true; // 屏幕可选分辨率
//        $respondContent['has_no_volume'] = false; // 是否拥有成交量
//        $respondContent['has_empty_bars'] = true;
//        $respondContent['minmov'] = 1;
//        $respondContent['minmov2'] = 0;
//        $respondContent['name'] = "1";
//        $respondContent['pointvalue'] = 1;
//        $respondContent['pricescale'] = 100;
////        $respondContent['session'] = "0930-1630:1234567";
//        $respondContent['ticker'] = "1"; // 该参数会直接影响k线图获取哪个标
//        $respondContent['timezone'] = "Asia/Shanghai";
//        $respondContent['type'] = "stock";
//
//        return $this->resJson($respondContent);
    }

    /**
     * @return string
     * info : k线图-数据
     */
    public function actionHistory()
    {
        $timeShare = $this->gString('resolution', 1);
        $bid = $this->gString('symbol', 1);
        $from = $this->gInt('from', 0);
        $to = $this->gInt('to', NOW_TIME);
        if ($timeShare == 'D') {
            $timeShare = 60;
        }

        $data = TransService::getKLineTableCopy($timeShare, $bid, $from, $to);
        $respondContent['t'] = [];
        $respondContent['c'] = [];
        $respondContent['h'] = [];
        $respondContent['l'] = [];
        $respondContent['o'] = [];
        $respondContent['v'] = [];
        if (empty($data)) {
            $respondContent['s'] = 'no_data'; // ok|error|no_data
            return $this->resJson($respondContent);
        }
        foreach ($data['list'] as $key => $val) {
            array_push($respondContent['t'], (int) $val['time_stamp']);
            array_push($respondContent['h'], (float) $val['max_price']);
            array_push($respondContent['c'], (float) $val['close_price']);
            array_push($respondContent['l'], (float) $val['min_price']);
            array_push($respondContent['o'], (float) $val['open_price']);
            array_push($respondContent['v'], (float) $val['trans_amount']);
        }
//
//        $respondContent['time'] = [];
//        $respondContent['close'] = [];
//        $respondContent['high'] = [];
//        $respondContent['low'] = [];
//        $respondContent['open'] = [];
//        $respondContent['volume'] = [];
//        if (empty($data)) {
//            $respondContent['s'] = 'no_data'; // ok|error|no_data
//            return $this->resJson($respondContent);
//        }
//        foreach ($data['list'] as $key => $val) {
//            array_push($respondContent['time'], (int) $val['time_stamp']);
//            array_push($respondContent['high'], (float) $val['max_price']);
//            array_push($respondContent['close'], (float) $val['close_price']);
//            array_push($respondContent['low'], (float) $val['min_price']);
//            array_push($respondContent['open'], (float) $val['open_price']);
//            array_push($respondContent['volume'], (float) $val['trans_amount']);
//        }

        $respondContent['s'] = 'ok'; // ok|error|no_data
        return $this->resJson($respondContent);
    }



}