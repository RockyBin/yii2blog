<?php
namespace api\controllers;

use Yii;
use common\models\ApiLoginForm;
use yii\rest\Controller;
use api\controllers\BaseController;

class UserController extends BaseController{

    //免签名
    public $controllers = ['user'];
    //免认证
    public $optional = ['login'];

    public function actionLogin(){

        $model = new ApiLoginForm();

        $model->load(Yii::$app->getRequest()->getBodyParams(),'');

        if($res = $model->login()){
            return ['code'=>200, 'data'=>$res];
        }else{
            $model->validate();
            return $model;
        }

    }

}