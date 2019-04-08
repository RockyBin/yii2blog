<?php
namespace common\lib;

use yii\web\ErrorHandler;

class Except extends ErrorHandler{

    public function renderException($exception) {
        $data = [
            'code' => $exception->getCode(),
            'msg' => $exception->getMessage(),
            'data' => [
                'file' => $exception->getFile(),
                'line' => $exception->getLine()
            ]
        ];
        echo json_encode($data);
        die;
    }
}