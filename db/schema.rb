# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_19_184015) do

  create_table "action_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "agency_type"
    t.string "short_name"
    t.text "description"
    t.text "more_information"
    t.integer "entries_count", default: 0, null: false
    t.text "entries_1_year_weekly"
    t.text "entries_5_years_monthly"
    t.text "entries_all_years_quarterly"
    t.text "related_topics_cache"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "url"
    t.boolean "active"
    t.text "cfr_citation"
    t.string "display_name"
    t.string "pseudonym"
    t.index ["name", "parent_id"], name: "index_agencies_on_name_and_parent_id"
    t.index ["parent_id", "name"], name: "index_agencies_on_parent_id_and_name"
  end

  create_table "agencies_sections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "section_id"
    t.integer "agency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
    t.index ["agency_id", "section_id"], name: "index_agencies_sections_on_agency_id_and_section_id"
    t.index ["section_id", "agency_id"], name: "index_agencies_sections_on_section_id_and_agency_id"
  end

  create_table "agency_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "assignable_id"
    t.integer "agency_id"
    t.integer "position"
    t.string "assignable_type"
    t.integer "agency_name_id"
    t.index ["agency_id", "assignable_id"], name: "index_agency_assignments_on_agency_id_and_assignable_id"
    t.index ["agency_name_id"], name: "index_agency_assignments_on_agency_name_id"
    t.index ["assignable_type", "assignable_id", "agency_id"], name: "index_agency_assignments_on_assignable_and_agency_id"
  end

  create_table "agency_highlights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "agency_id"
    t.date "highlight_until"
    t.boolean "published", default: false
    t.string "section_header"
    t.string "title"
    t.string "abstract"
    t.index ["highlight_until"], name: "index_agency_highlights_on_highlight_until"
  end

  create_table "agency_name_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "assignable_id"
    t.integer "agency_name_id"
    t.integer "position"
    t.string "assignable_type"
    t.index ["agency_name_id", "assignable_id"], name: "index_agency_name_assignments_on_agency_name_id_and_entry_id"
    t.index ["assignable_type", "assignable_id", "agency_name_id"], name: "index_agency_name_assignments_on_assignable_and_agency_name_id"
  end

  create_table "agency_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "agency_id"
    t.boolean "void", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["agency_id", "name"], name: "index_agency_names_on_agency_id_and_name"
    t.index ["name", "agency_id"], name: "index_agency_names_on_name_and_agency_id"
    t.index ["name"], name: "index_agency_names_on_name", unique: true
  end

  create_table "canned_searches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "section_id"
    t.string "title"
    t.string "slug"
    t.text "description"
    t.text "search_conditions"
    t.boolean "active"
    t.integer "position"
    t.text "sphinx_conditions", size: :medium
    t.index ["section_id", "active"], name: "index_canned_searches_on_section_id_and_active"
    t.index ["slug"], name: "index_canned_searches_on_slug"
  end

  create_table "cfr_parts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "year"
    t.integer "title"
    t.integer "part"
    t.integer "volume"
    t.string "name"
    t.index ["year", "title", "part"], name: "index_cfr_parts_on_year_and_title_and_part"
  end

  create_table "citation_counts", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "cited_entry_id"
    t.bigint "count", default: 0, null: false
    t.index ["cited_entry_id"], name: "cited_entry_id", unique: true
  end

  create_table "citations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "source_entry_id"
    t.integer "cited_entry_id"
    t.string "citation_type"
    t.string "part_1"
    t.string "part_2"
    t.string "part_3"
    t.index ["cited_entry_id", "citation_type", "source_entry_id"], name: "cited_citation_source"
    t.index ["source_entry_id", "citation_type", "cited_entry_id"], name: "source_citation_cited"
  end

  create_table "dictionary_words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at"
    t.integer "creator_id"
  end

  create_table "docket_documents", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "docket_id"
    t.string "title", limit: 1000
    t.text "metadata"
    t.index ["docket_id"], name: "index_docket_documents_on_docket_id"
  end

  create_table "docket_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "number"
    t.string "assignable_type"
    t.integer "assignable_id"
    t.integer "position", default: 0
    t.index ["assignable_type", "assignable_id"], name: "index_docket_numbers_on_assignable_type_and_assignable_id"
  end

  create_table "dockets", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "regulation_id_number"
    t.integer "comments_count"
    t.integer "docket_documents_count"
    t.string "title", limit: 1000
    t.text "metadata"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "title"
    t.text "abstract"
    t.text "contact"
    t.text "dates"
    t.text "action"
    t.string "part_name"
    t.string "citation"
    t.string "granule_class"
    t.string "document_number"
    t.string "toc_subject", limit: 1000
    t.string "toc_doc", limit: 1000
    t.integer "start_page"
    t.integer "end_page"
    t.date "publication_date"
    t.datetime "places_determined_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "delta", default: true, null: false
    t.string "source_text_url"
    t.string "regulationsdotgov_url"
    t.string "comment_url"
    t.datetime "checked_regulationsdotgov_at"
    t.integer "volume"
    t.datetime "full_xml_updated_at"
    t.integer "citing_entries_count", default: 0
    t.string "document_file_path"
    t.datetime "full_text_updated_at"
    t.string "curated_title"
    t.string "curated_abstract", limit: 500
    t.integer "lede_photo_id"
    t.text "lede_photo_candidates"
    t.datetime "raw_text_updated_at"
    t.boolean "significant", default: false
    t.integer "presidential_document_type_id"
    t.date "signing_date"
    t.integer "action_name_id"
    t.integer "correction_of_id"
    t.string "regulations_dot_gov_docket_id"
    t.text "executive_order_notes"
    t.string "fr_index_subject"
    t.string "fr_index_doc"
    t.integer "issue_number"
    t.string "comment_url_override"
    t.string "presidential_document_number"
    t.string "regulations_dot_gov_document_id"
    t.integer "comment_count"
    t.index ["citation"], name: "index_entries_on_citation"
    t.index ["citing_entries_count"], name: "index_entries_on_citing_entries_count"
    t.index ["correction_of_id"], name: "index_entries_on_correction_of"
    t.index ["delta"], name: "index_entries_on_delta"
    t.index ["document_number"], name: "index_entries_on_document_number"
    t.index ["full_text_updated_at"], name: "index_entries_on_full_text_updated_at"
    t.index ["full_xml_updated_at"], name: "index_entries_on_full_xml_updated_at"
    t.index ["granule_class"], name: "index_entries_on_agency_id_and_granule_class"
    t.index ["id", "publication_date"], name: "index_entries_on_id_and_publication_date"
    t.index ["id"], name: "index_entries_on_agency_id_and_id"
    t.index ["presidential_document_number", "presidential_document_type_id"], name: "pres_doc_number_pres_doc_type_id", length: { presidential_document_number: 10 }
    t.index ["presidential_document_type_id", "presidential_document_number"], name: "presidential_document_type_id", length: { presidential_document_number: 10 }
    t.index ["publication_date"], name: "index_entries_on_agency_id_and_publication_date"
    t.index ["raw_text_updated_at"], name: "index_entries_on_raw_text_updated_at"
    t.index ["significant"], name: "index_entries_on_significant"
    t.index ["volume", "start_page", "id"], name: "index_entries_on_volume_and_start_page_and_id"
  end

  create_table "entry_cfr_references", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "title"
    t.integer "part"
    t.integer "chapter"
    t.index ["entry_id"], name: "index_entry_cfr_references_on_entry_id"
  end

  create_table "entry_changes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.index ["entry_id"], name: "index_entry_changes_on_entry_id", unique: true
  end

  create_table "entry_emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "remote_ip"
    t.integer "num_recipients"
    t.integer "entry_id"
    t.string "sender_hash"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "document_number"
  end

  create_table "entry_page_views", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.datetime "created_at"
    t.string "remote_ip"
    t.text "raw_referer"
    t.index ["created_at"], name: "index_entry_page_views_on_created_at"
    t.index ["entry_id"], name: "index_entry_page_views_on_entry_id"
  end

  create_table "entry_regulation_id_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.string "regulation_id_number"
    t.index ["entry_id", "regulation_id_number"], name: "index"
    t.index ["regulation_id_number", "entry_id"], name: "rin_then_entry"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.date "date"
    t.string "title"
    t.integer "place_id"
    t.boolean "remote_call_in_available"
    t.string "event_type"
    t.boolean "delta", default: true, null: false
    t.index ["delta"], name: "index_events_on_delta"
    t.index ["event_type", "entry_id", "date"], name: "index_events_on_event_type_and_entry_id_and_date"
    t.index ["event_type", "entry_id", "place_id"], name: "index_events_on_event_type_and_entry_id_and_place_id"
    t.index ["event_type", "place_id", "entry_id"], name: "index_events_on_event_type_and_place_id_and_entry_id"
  end

  create_table "fr_index_agency_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "year"
    t.integer "agency_id"
    t.date "last_completed_issue"
    t.integer "needs_attention_count"
    t.date "oldest_issue_needing_attention"
    t.date "last_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["year", "agency_id"], name: "index_fr_index_agency_statuses_on_year_and_agency_id"
  end

  create_table "generated_files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "parameters"
    t.string "token"
    t.datetime "processing_began_at"
    t.datetime "processing_completed_at"
    t.string "attachment_file_name"
    t.string "attachment_file_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_document_count"
    t.integer "processed_document_count"
  end

  create_table "gpo_graphic_packages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "graphic_identifier"
    t.string "package_identifier"
    t.date "package_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["graphic_identifier"], name: "index_gpo_graphic_packages_on_graphic_identifier"
    t.index ["package_date"], name: "index_gpo_graphic_packages_on_package_date"
    t.index ["package_identifier"], name: "index_gpo_graphic_packages_on_package_identifier"
  end

  create_table "gpo_graphic_usages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "identifier"
    t.string "document_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "xml_identifier"
    t.index ["document_number", "identifier"], name: "index_gpo_graphic_usages_on_document_number_and_identifier", unique: true
    t.index ["document_number", "xml_identifier"], name: "index_gpo_graphic_usages_on_document_number_and_xml_identifier"
    t.index ["identifier", "document_number"], name: "index_gpo_graphic_usages_on_identifier_and_document_number"
    t.index ["xml_identifier", "document_number"], name: "index_gpo_graphic_usages_on_xml_identifier_and_document_number"
  end

  create_table "gpo_graphics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "identifier"
    t.string "graphic_file_name"
    t.string "graphic_content_type"
    t.integer "graphic_file_size"
    t.datetime "graphic_updated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "package_identifier"
    t.index ["graphic_file_name"], name: "index_gpo_graphics_on_graphic_file_name"
    t.index ["identifier"], name: "index_gpo_graphics_on_identifier", unique: true
  end

  create_table "graphic_usages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "graphic_id"
    t.integer "entry_id"
    t.index ["entry_id", "graphic_id"], name: "index_graphic_usages_on_entry_id_and_graphic_id"
    t.index ["graphic_id", "entry_id"], name: "index_graphic_usages_on_graphic_id_and_entry_id"
  end

  create_table "graphics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "identifier"
    t.integer "usage_count", default: 0, null: false
    t.string "graphic_file_name"
    t.string "graphic_content_type"
    t.integer "graphic_file_size"
    t.datetime "graphic_updated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "inverted"
    t.index ["identifier"], name: "index_graphics_on_identifier", unique: true
  end

  create_table "issue_approvals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.date "publication_date"
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publication_date"], name: "index_issue_approvals_on_publication_date"
  end

  create_table "issues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.date "publication_date"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lede_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "credit"
    t.string "credit_url"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "url"
    t.integer "crop_width"
    t.integer "crop_height"
    t.integer "crop_x"
    t.integer "crop_y"
  end

  create_table "mailing_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "search_conditions"
    t.string "title"
    t.integer "active_subscriptions_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

  create_table "pil_agency_letters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "public_inspection_document_id"
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.string "title"
    t.index ["public_inspection_document_id"], name: "index_pil_agency_letters_on_public_inspection_document_id"
  end

  create_table "place_determinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "entry_id"
    t.bigint "place_id"
    t.string "string"
    t.string "context"
    t.integer "confidence"
    t.float "relevance_score"
    t.index ["entry_id", "confidence", "place_id"], name: "index_place_determinations_on_entry_id_and_place_id"
    t.index ["entry_id"], name: "index_place_determinations_on_entry_id"
    t.index ["place_id", "confidence", "entry_id"], name: "index_place_determinations_on_place_id_and_entry_id"
    t.index ["place_id"], name: "index_place_determinations_on_place_id"
  end

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "place_type"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "open_calais_guid", limit: 100
    t.index ["open_calais_guid"], name: "index_places_on_open_calais_guid", unique: true
  end

  create_table "public_inspection_documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "document_number"
    t.string "granule_class"
    t.datetime "filed_at"
    t.date "publication_date"
    t.boolean "special_filing", default: false, null: false
    t.string "pdf_file_name"
    t.integer "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.text "editorial_note"
    t.string "document_file_path"
    t.datetime "raw_text_updated_at"
    t.boolean "delta", default: true, null: false
    t.integer "num_pages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "entry_id"
    t.string "subject_1", limit: 1000
    t.string "subject_2", limit: 1000
    t.string "subject_3", limit: 1000
    t.string "pdf_url"
    t.string "category"
    t.datetime "update_pil_at"
    t.index ["delta"], name: "index_public_inspection_documents_on_delta"
    t.index ["document_number"], name: "index_public_inspection_documents_on_document_number"
    t.index ["entry_id"], name: "index_public_inspection_documents_on_entry_id"
    t.index ["publication_date"], name: "index_public_inspection_documents_on_publication_date"
  end

  create_table "public_inspection_issues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.date "publication_date"
    t.datetime "published_at"
    t.datetime "special_filings_updated_at"
    t.datetime "regular_filings_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "special_filing_documents_count"
    t.integer "special_filing_agencies_count"
    t.integer "regular_filing_documents_count"
    t.integer "regular_filing_agencies_count"
    t.index ["published_at", "publication_date"], name: "published_at_then_date"
  end

  create_table "public_inspection_postings", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "issue_id"
    t.integer "document_id"
    t.index ["issue_id", "document_id"], name: "index_public_inspection_postings_on_issue_id_and_document_id"
  end

  create_table "regulatory_plan_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "regulatory_plan_id"
    t.string "date"
    t.string "action"
    t.string "fr_citation"
    t.index ["regulatory_plan_id"], name: "index_regulatory_plan_events_on_regulatory_plan_id"
  end

  create_table "regulatory_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "regulation_id_number"
    t.string "issue"
    t.text "title"
    t.text "abstract"
    t.string "priority_category"
    t.boolean "delta", default: true, null: false
    t.boolean "current"
    t.index ["current", "regulation_id_number"], name: "index_regulatory_plans_on_current_and_regulation_id_number"
    t.index ["delta"], name: "index_regulatory_plans_on_delta"
    t.index ["issue", "regulation_id_number"], name: "index_regulatory_plans_on_issue_and_regulation_id_number"
    t.index ["regulation_id_number", "issue"], name: "index_regulatory_plans_on_regulation_id_number_and_issue"
  end

  create_table "regulatory_plans_small_entities", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "regulatory_plan_id"
    t.integer "small_entity_id"
    t.index ["regulatory_plan_id", "small_entity_id"], name: "reg_then_entity"
    t.index ["small_entity_id", "regulatory_plan_id"], name: "index_small_entity_id_and_regulatory_plan_id"
  end

  create_table "reprocessed_issues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "issue_id"
    t.string "status", limit: 1000
    t.string "message", limit: 1000
    t.text "diff"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "html_diff", size: :medium
    t.index ["issue_id", "status"], name: "index_reprocessed_issues_on_issue_id_and_status"
    t.index ["user_id"], name: "index_reprocessed_issues_on_user_id"
  end

  create_table "section_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "section_id"
    t.index ["entry_id", "section_id"], name: "index_section_assignments_on_entry_id_and_section_id"
    t.index ["section_id", "entry_id"], name: "index_section_assignments_on_section_id_and_entry_id"
  end

  create_table "section_highlights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "section_id"
    t.integer "entry_id"
    t.integer "position"
    t.date "publication_date"
    t.index ["section_id", "entry_id"], name: "index_section_highlights_on_section_id_and_entry_id"
  end

  create_table "sections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.integer "position"
    t.text "description"
    t.text "relevant_cfr_sections"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
  end

  create_table "site_notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "identifier"
    t.string "notification_type"
    t.text "description"
    t.boolean "active"
  end

  create_table "small_entities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
  end

  create_table "subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "mailing_list_id"
    t.string "email"
    t.string "requesting_ip"
    t.string "token"
    t.datetime "confirmed_at"
    t.datetime "unsubscribed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_delivered_at"
    t.integer "delivery_count", default: 0
    t.date "last_issue_delivered"
    t.string "environment"
  end

  create_table "topic_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "entry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "topics_topic_name_id"
    t.index ["entry_id", "topic_id"], name: "index_topic_assignments_on_entry_id_and_topic_id"
    t.index ["topic_id", "entry_id"], name: "index_topic_assignments_on_topic_id_and_entry_id"
    t.index ["topics_topic_name_id"], name: "index_topic_assignments_on_topics_topic_name_id"
  end

  create_table "topic_name_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "topic_name_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entry_id", "topic_name_id"], name: "index_topic_name_assignments_on_entry_id_and_topic_name_id"
    t.index ["topic_name_id", "entry_id"], name: "index_topic_name_assignments_on_topic_name_id_and_entry_id"
  end

  create_table "topic_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.boolean "void", default: false
    t.integer "entries_count", default: 0
    t.integer "topics_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_topic_names_on_name"
    t.index ["void", "topics_count"], name: "index_topic_names_on_void_and_topics_count"
  end

  create_table "topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.integer "entries_count", default: 0
    t.text "related_topics_cache"
    t.text "related_agencies_cache"
    t.index ["entries_count"], name: "index_topics_on_entries_count"
    t.index ["name"], name: "index_topics_on_name"
    t.index ["slug", "id"], name: "index_topics_on_slug_and_id"
  end

  create_table "topics_topic_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "topic_name_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
    t.index ["topic_id", "topic_name_id"], name: "index_topics_topic_names_on_topic_id_and_topic_name_id"
    t.index ["topic_name_id", "topic_id"], name: "index_topics_topic_names_on_topic_name_id_and_topic_id"
  end

  create_table "url_references", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "url_id"
    t.bigint "entry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entry_id"], name: "index_url_references_on_entry_id"
    t.index ["url_id"], name: "index_url_references_on_url_id"
  end

  create_table "urls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "content_type"
    t.integer "response_code"
    t.float "content_length"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_urls_on_name"
    t.index ["type"], name: "index_urls_on_type"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token", null: false
    t.string "single_access_token", null: false
    t.string "perishable_token", null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "creator_id"
    t.integer "updater_id"
    t.string "first_name"
    t.string "last_name"
    t.boolean "active", default: true
  end

end
