# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.3.0

* System dependencies

* Configuration

* Database creation
	rails db:create
* Database initialization

* How to run the apis
	POST : localhost:3000/api/group_events
	Sample Data
	{
	"description": "test",
	"start": "2017-11-17",
	"end": "2017-11-19",
	"published": true
	}

	PATCH/PUT : localhost:3000/api/group_events/1
	Sample Data
	{
	"description": "test2",
	"published": true
	}

	DELETE : localhost:3000/api/group_events/1

	


* ...
