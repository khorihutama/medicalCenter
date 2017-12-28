<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "resep".
 *
 * @property integer $id_resep
 * @property string $nama_pasien
 * @property integer $created_at
 * @property integer $status
 */
class Resep extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'resep';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama_pasien'], 'required'],
            [['created_at', 'status'], 'integer'],
            [['nama_pasien'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_resep' => 'Id Resep',
            'nama_pasien' => 'Nama Pasien',
            'created_at' => 'Created At',
            'status' => 'Status',
        ];
    }
}
