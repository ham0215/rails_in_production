class User < ApplicationRecord
  has_many :reviews

  class << self
    def benchmark_bulk_insert
      # create data
      import_data = []
      1_000.times { import_data << new(name: 'name', created_at: Time.current, updated_at: Time.current) }

      insert_data = []
      1_000.times { insert_data << { name: 'name', created_at: Time.current, updated_at: Time.current } }

      values = []
      1_000.times { values << "('name', '#{Time.current.to_s(:db)}', '#{Time.current.to_s(:db)}')" }
      sql = "INSERT INTO users (name, created_at, updated_at) VALUES #{values.join(',')}"

      require 'benchmark'
      Benchmark.bm 15 do |r|
        transaction do
          r.report 'sql' do
            100.times { bulk_insert_using_sql(sql) }
          end
          raise ActiveRecord::Rollback
        end

        transaction do
          r.report 'insert_all' do
            #bulk_insert_using_insert_all(import_data.map(&:attributes))
            100.times { bulk_insert_using_insert_all(insert_data) }
          end
          raise ActiveRecord::Rollback
        end

        transaction do
          r.report 'import' do
            100.times { bulk_insert_using_import(import_data) }
          end
          raise ActiveRecord::Rollback
        end
      end
    end

    def bulk_insert_using_import(users)
      import users
    end

    def bulk_insert_using_insert_all(users)
      insert_all users
    end

    def bulk_insert_using_sql(sql)
      connection.execute sql
    end
  end
end
