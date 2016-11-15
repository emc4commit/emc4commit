class AddEmercoinAddress2ToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :emercoin_address2, :string, index: true
    reversible do |dir|
      dir.up do
        Project.find_each do |project|
          project.generate_address2
        end
      end
    end
  end
end
