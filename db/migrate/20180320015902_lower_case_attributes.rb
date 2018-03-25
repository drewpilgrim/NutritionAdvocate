class LowerCaseAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_column :past_meals, :NA, :na
    rename_column :past_meals, :FATRN, :fatrn
    rename_column :past_meals, :FASAT, :fasat
    rename_column :past_meals, :CHOCDF, :chocdf
    rename_column :past_meals, :FIBTG, :fibtg
    rename_column :past_meals, :PROCNT, :procnt
    rename_column :past_meals, :VITC, :vitc
    rename_column :past_meals, :CA, :ca
    rename_column :past_meals, :FE, :fe
    rename_column :past_meals, :SUGAR, :sugar
    rename_column :past_meals, :ENERC_KCAL, :enerc_kcal
    rename_column :past_meals, :FAT, :fat
    rename_column :past_meals, :VITA_IU, :vita_iu
    rename_column :past_meals, :K, :k
    rename_column :past_meals, :CHOLE, :chole
  end
end
