
<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\business\BIssue */
/* @var $form yii\bootstrap\ActiveForm */
//?>

<div class="bissue-form form-horizontal">
    <?php $form = ActiveForm::begin([

        'options'=>[
            'class '=>'form-horizontal'
        ],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-sm-7\">{input}</div>\n<div class=\"col-sm-3\" >{error}</div>",
            'labelOptions' => ['class' => 'col-sm-2 control-label'],  //修改label的样式
        ],
    ]); ?>

    <? echo $form->field($model, 'bid_id')->label('交易标名')
        ->dropDownList(
            $options,
            ['prompt'=>'-- 交易标 --','style'=>'width:120px']
        )  ?>
    <?php echo $form->field($model, 'price')->textInput(['maxlength' => true,'placeholder' => '0.00']) ?>

    <?php echo $form->field($model, 'entrust_amount')->textInput(['maxlength' => true, 'placeholder' => '0.000000']) ?>

    <?php echo $form->field($model, 'trans_amount')->textInput(['maxlength' => true, 'placeholder' => '0.000000']) ?>

    <? echo $form->field($model, 'status')->label('状态')
        ->dropDownList(
            ['0' => '下架', '1' => '上架'],
            ['prompt'=>'-- 状态 --','style'=>'width:120px']
        )  ?>

    <? echo \common\widgets\DateTimePicker::widget([
        'title' => '开始时间',
        'model' => $model,
        'form' => $form,
        'value' => $model->start_time,
        'attribute' => 'start_time'
    ]); ?>

    <? echo \common\widgets\DateTimePicker::widget([
        'title' => '结束时间',
        'model' => $model,
        'form' => $form,
        'value' => $model->start_time,
        'attribute' => 'end_time'
    ]); ?>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <?php echo Html::submitButton($model->isNewRecord ? '增加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success btn-sm' : 'btn btn-primary btn-sm']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>