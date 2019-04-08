<?php
namespace api\controllers;

use Yii;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\Cors;
use yii\rest\ActiveController;

class BaseController extends ActiveController{

    public $data;

    //不用签名控制器
    public $controllers = [];

    public $modelClass = '';

    //不用认证的方法名
    public $optional = [];

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        unset($behaviors['authenticator']);

        $behaviors['corsFilter'] = [
            'class' => Cors::className(),
            'cors'=>[
                'Origin' => ['*'],
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Request-Headers' => ['*'],
            ],
        ];

        $behaviors['authenticator'] = [
            'class' => HttpBearerAuth::className(),
            'except' => ['options'],
            'optional' => $this->optional,
        ];

        return $behaviors;
    }

    public function afterAction($action, $result)
    {

        $this->getData();
        $this->getSign();
        return parent::afterAction($action, $result);
    }

    protected function getSign(){

        $controller = $this->id;
        $action = Yii::$app->controller->action->id;

        if(!in_array($controller, $this->controllers)){
            if(isset($this->data['sign']) && !empty($this->data['sign'])){

                $sign = md5($controller . $action. Yii::$app->params['signRand']);

                if($this->data['sign'] != $sign){
                    echo json_encode(['code' => -1, 'msg'=>'sign error']);exit;
                }

            }else{
                echo json_encode(['code' => -1, 'msg'=>'sign error']);exit;
            }
        }

    }

    protected function getData(){

        $request = Yii::$app->request;
        $method = $request->getMethod();
        $this->data = $request->$method() ? $request->$method() : [];
    }

}
