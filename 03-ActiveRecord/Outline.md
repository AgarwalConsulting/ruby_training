Prerequisites
-------------

- Set up Ruby
- Set up RoR

ActiveRecord
------------

- ActiveRecord Overview
  - M in MVC
  - which is the layer of the system responsible for representing business data and logic
  - In other words, it's an ORM
    - Why an ORM?
      - Adaptability (version changes) and portability (database changes)
  - Wait, but why a database?
    - To persist data, of course!
  - Convention, over Configuration
    - Model - Table mapping (Post - posts)
    - schema conventions
      - Foreign keys (post_id)
      - Primary keys (id)

- Domain Modeling, Ruby, and Rails
    ```ruby
      class Post < ApplicationRecord
      end
    ```
  - `ApplicationRecord < ActiveRecord::Base`
  - `self.table_name = "my_products"`
  - Migrations
    ```sql
      CREATE TABLE products (
        id int(11) NOT NULL auto_increment,
        name varchar(255),
        PRIMARY KEY  (id)
      );
    ```
  - `self.primary_key = "product_id"`

- Programming the Domain
  - Setting up associations
    - belongs_to
    - has_one
    - has_many
    - has_and_belongs_to_many
    - has_* :through
    - Self joins
  - Callbacks
    - Lifecycle hooks!
    - We will cover in a future class along with validations
- Creating the Database Tables
  - Adapters
    - `database.yml`
  - Migrations
    `rails g migration AddColumnToPosts writer:name`


- The Rails Application Console
  - Seeing it in action
    - `rails generate model post name:string description:string category:string`
    - `rails generate model comment commenter:string description:string post:references`
  - `rails generate --help`
  - `rails generate model --help`
  - `rails c`

  - CRUD operations

  Create
    - `post_params = {name: "Hello, World!", description: "This is a post to describe creation of new object in rails", category: "misc"}`

    - `post = Post.new(post_params)`
    - `post.save`
    (or)
    - `post = Post.create(post_params)`

  Read
    - `Post.all`
    - `Post.first`
    - `Post.find()`
    - `Post.find_by_*()`

  Update
    - `post = Post.first; post.name = "Hello"; post.save`

  Delete
    - `post.destroy`

  Associations
    Methods created by belongs_to:
      association
      association=(associate)
      build_association(attributes = {})
      create_association(attributes = {})
      create_association!(attributes = {})
      reload_association

      Options:
        :autosave
        :class_name
        :counter_cache
        :dependent
        :foreign_key
        :primary_key
        :inverse_of
        :polymorphic
        :touch
        :validate
        :optional

      Scoping:
        where
        includes
        readonly
        select

  - `rails db:console`

References
----------
  - https://guides.rubyonrails.org/active_record_basics.html
  - https://guides.rubyonrails.org/association_basics.html
  - https://guides.rubyonrails.org/active_record_callbacks.html
  - https://guides.rubyonrails.org/generators.html
  - https://guides.rubyonrails.org/command_line.html
