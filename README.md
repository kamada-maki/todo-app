## 必須機能要件
- タスクの登録
[![Image from Gyazo](https://i.gyazo.com/ef85ceadfbefdef6325f2d541d4f52b2.gif)](https://gyazo.com/ef85ceadfbefdef6325f2d541d4f52b2)
- タスクの編集
[![Image from Gyazo](https://i.gyazo.com/2bfb63a7a42319ade0dd164b431e01b0.gif)](https://gyazo.com/2bfb63a7a42319ade0dd164b431e01b0)
- タスクの削除
[![Image from Gyazo](https://i.gyazo.com/bd14294e29140bb9cac632370620a139.gif)](https://gyazo.com/bd14294e29140bb9cac632370620a139)
- 他タスクとの連動性：依存関係を持たせることが出来る＝親子タスク機能
※主要なタスクに紐付いた細分化したタスクを分け
[![Image from Gyazo](https://i.gyazo.com/688944149c554e4516481060b4db8da9.gif)](https://gyazo.com/688944149c554e4516481060b4db8da9)

- タスクのタイトルおよび詳細→主要なタスク、細分化したタスクともに実装
- ステータス、期日、担当→主要なタスク、細分化したタスクともに実装

##　使用言語



## テーブル設計
![テーブル設計図](https://user-images.githubusercontent.com/74590047/109259298-4290f100-783f-11eb-95f6-65317628fec2.png)


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
| column       | Type         |  Options            |
|--------------|------------- |---------------------|
|title         |string        | null: false         |
|user          |references    | foreign_key: true   |
|task_category |references    | foreign_key: true   |
|description   |text          | null: false         |
|deadline      |datetime      | null: false         |
|state_id      |string        | null: false         |

#### Association
- belongs_to :user
- belongs_to :task_category
