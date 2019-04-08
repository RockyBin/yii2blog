<?php
namespace api\controllers;

use Yii;
use api\controllers\BaseController;
use yii\data\Pagination;
use yii\debug\models\timeline\DataProvider;
use yii\helpers\ArrayHelper;
use \yii\rest\Controller;
use common\models\Goods;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\Cors;
use common\lib\Paginations;

class GoodsController extends BaseController{

    public $modelClass = 'common\models\Goods';

    //免签名
    public $controllers = ['goods'];

    public function actionList(){

        $page = !empty($this->data['page']) ? $this->data['page'] : 1;
        $pageSize = !empty($this->data['pageSize']) ? $this->data['pageSize'] : 5;

        $query = Goods::find();
        $totalCount = $query->count();

        $pagination = new Paginations([
            'totalCount' => $totalCount,
            'pageSize' => $pageSize
        ]);

        $data = $query->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return ['status'=>200,'data'=>$data,'page'=>$page, 'pageSize'=>$pageSize, 'total'=>$totalCount];
    }

    public function actionSearch(){
        $keyword = !empty($_REQUEST['keyword']) ? $_REQUEST['keyword'] : '';
        $pageSize = !empty($_REQUEST['pageSize']) ? $_REQUEST['pageSize'] : 5;

        $query = Goods::find()->where(['name'=>$keyword]);

        $totalCount = $query->count();

        $pagination = new Pagination([
            'totalCount' => $totalCount,
            'pageSize' => $pageSize,
        ]);

        $data = $query->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $data;
    }

}
