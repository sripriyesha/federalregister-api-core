class AddNumPagesToPublicInspectionDocuments < ActiveRecord::Migration[6.0]
  def self.up
    add_column :public_inspection_documents, :num_pages, :integer
  end

  def self.down
    remove_column :public_inspection_documents, :num_pages
  end
end
