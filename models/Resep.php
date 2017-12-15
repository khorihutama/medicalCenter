<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "resep".
 *
 * @property integer $id_resep
 * @property string $nama_pasien
 * @property integer $id_obat
 * @property integer $dosis
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
            [['id_resep', 'nama_pasien', 'id_obat', 'dosis', 'status'], 'required'],
            [['id_resep', 'id_obat', 'dosis', 'status'], 'integer'],
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
            'id_obat' => 'Id Obat',
            'dosis' => 'Dosis',
            'status' => 'Status',
        ];
    }
}
