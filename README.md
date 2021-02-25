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
|deadline    |date          | null: false         |
|state       |string        | null: false         |

#### Association
- belongs_to :user
- has_many :detail_tasks


### detail_taskテーブル
| column     | Type         |  Options            |
|------------|------------- |---------------------|
|title       |string        | null: false         |
|user        |references    | foreign_key: true   |
|description |text          | null: false         |
|deadline    |date          | null: false         |
|state       |string        | null: false         |

#### Association
- belongs_to :user
- belongs_to :task_category