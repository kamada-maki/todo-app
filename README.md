## 必須機能要件
- タスクの登録、編集、削除
- タスクのタイトルおよび詳細
- ステータス、期日、担当
- 他タスクとの連動性：依存関係を持たせることが出来る＝親子タスク機能


## テーブル設計
![テーブル設計図](https://user-images.githubusercontent.com/74590047/109096240-88c35300-7760-11eb-920a-c7d068464867.png)

### usersテーブル
---------------------------------------------
| Column     | Type         |  Options      |
|------------|--------------|---------------|
| email      | string       | null: false   |
| password   | string       | null: false   |
| name       | string       | null: false   |

#### Association
- has_many :task_categories
- has_many :detail_tasks
---------------------------------------------
### task_categoryテーブル
| column     | Type         |  Options            |
|------------|------------- |---------------------|
|title       |string        | null: false         |
|user        |references    | foreign_key: true   |
|description |text          | null: false         |
|deadline    |datetime      | null: false         |
|state_id    |string        | null: false         |

#### Association
- belongs_to :user
- has_many :detail_tasks


### detail_taskテーブル
| column     | Type         |  Options            |
|------------|------------- |---------------------|
|title       |string        | null: false         |
|user        |references    | foreign_key: true   |
|description |text          | null: false         |
|deadline    |datetime      | null: false         |
|state_id    |string        | null: false         |

#### Association
- belongs_to :user
- belongs_to :task_category
