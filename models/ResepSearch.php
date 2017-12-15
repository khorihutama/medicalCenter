<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Resep;

/**
 * ResepSearch represents the model behind the search form about `app\models\Resep`.
 */
class ResepSearch extends Resep
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_resep', 'id_obat', 'dosis', 'status'], 'integer'],
            [['nama_pasien'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Resep::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_resep' => $this->id_resep,
            'id_obat' => $this->id_obat,
            'dosis' => $this->dosis,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'nama_pasien', $this->nama_pasien]);

        return $dataProvider;
    }
}
