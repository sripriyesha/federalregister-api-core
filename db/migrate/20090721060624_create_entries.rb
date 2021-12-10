class CreateEntries < ActiveRecord::Migration[6.0]
  def self.up
    create_table :entries do |t|
      t.text :title, :abstract, :contact, :dates, :action
      t.string  :type, :link, :genre, :part_name, :citation
      t.string  :granule_class, :document_number, :toc_subject, :toc_doc
      t.integer :length, :start_page, :end_page
      t.belongs_to :agency
      t.date :publication_date, :effective_date
      t.datetime :places_determined_at
      t.timestamps
    end

    add_index :entries, :document_number
  end

  def self.down
    drop_table :entries
  end
end
