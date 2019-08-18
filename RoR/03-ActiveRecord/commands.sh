#!/usr/bin/env bash

## Creating a new rails application
rails new posts
cd posts

## Locking on a specific sqlite3 version
gsed -i s/"gem 'sqlite3'"/"gem 'sqlite3', '~> 1.3.6'"/g Gemfile
bundle install

## Creating a migration
rails generate model post name:string description:string category:string
rails db:migrate
  rails db:rollback
