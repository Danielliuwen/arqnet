<?php

/**
 * This is the model class for table "question".
 *
 * The followings are the available columns in table 'question':
 * @property integer $question_id
 * @property integer $user_id
 * @property string $content
 * @property string $quantitive
 * @property integer $is_active
 * @property string $date_created
 * @property string $date_modified
 *
 * The followings are the available model relations:
 * @property Answer[] $answers
 * @property CategoryQuestion[] $categoryQuestions
 * @property User $user
 * @property QuestionAction[] $questionActions
 * @property QuestionChoice[] $questionChoices
 */
class Question extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'question';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('user_id, is_active', 'numerical', 'integerOnly'=>true),
			array('content, quantitative, date_created, date_modified', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('question_id, user_id, content, quantitative, is_active, date_created, date_modified', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'answers' => array(self::HAS_MANY, 'Answer', 'question_id'),
			'categoryQuestions' => array(self::HAS_MANY, 'CategoryQuestion', 'question_id'),
			'user' => array(self::BELONGS_TO, 'User', 'user_id'),
			'questionActions' => array(self::HAS_MANY, 'QuestionAction', 'question_id'),
			'questionChoices' => array(self::HAS_MANY, 'QuestionChoice', 'question_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'question_id' => 'Question',
			'user_id' => 'User',
			'content' => 'Content',
			'quantitative' => 'Quantitative',
			'is_active' => 'Is Active',
			'date_created' => 'Date Created',
			'date_modified' => 'Date Modified',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('question_id',$this->question_id);
		$criteria->compare('user_id',$this->user_id);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('quantitative',$this->quantitative);
		$criteria->compare('is_active',$this->is_active);
		$criteria->compare('date_created',$this->date_created,true);
		$criteria->compare('date_modified',$this->date_modified,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Question the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	public function getQuestionsAsked($user_id)
	{
		$list = Yii::app()->db->createCommand(
			'select q.content,DATE_FORMAT(q.date_created,\'%m/%d/%Y\') as date_created,count(a.question_id) as nAnswers
			from question q
			left join answer a
			on q.question_id = a.question_id
			and q.user_id = :user_id
			group by q.question_id')->
			bindValues(array(
					':user_id'=>Yii::app()->user->id,
			))->queryAll();
		return $list;		
	}
	
	/**
	 * Get questions this user has answered
	 * @param User $user_id
	 */
	public function getQuestionsAnswered($user_id)
	{
		$list = Yii::app()->db->createCommand(
			'select a.user_answer,DATE_FORMAT(a.date_created,\'%m/%d/%Y\') as date_created,
			q.content,qc.content as choice,c.display_name as category
			from answer a join question q on q.question_id=a.question_id 
			left join question_choice qc on a.question_choice_id = qc.question_choice_id 
			left join category_question cg on cg.question_id = a.question_id 
			left join category c on cg.category_id=c.category_id and a.user_id= :user_id
			and a.is_active = 1')->
			bindValues(array(
				':user_id'=>Yii::app()->user->id,
			))->queryAll();
			return $list;
	}
}
