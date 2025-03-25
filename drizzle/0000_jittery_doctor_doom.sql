CREATE TYPE "public"."enum__pages_v_blocks_archive_populate_by" AS ENUM('collection', 'selection');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_blocks_archive_relation_to" AS ENUM('posts');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_blocks_content_columns_link_appearance" AS ENUM('default', 'outline');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_blocks_content_columns_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_blocks_content_columns_size" AS ENUM('oneThird', 'half', 'twoThirds', 'full');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_blocks_cta_links_link_appearance" AS ENUM('default', 'outline');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_blocks_cta_links_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_version_hero_links_link_appearance" AS ENUM('default', 'outline');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_version_hero_links_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_version_hero_type" AS ENUM('none', 'highImpact', 'mediumImpact', 'lowImpact');--> statement-breakpoint
CREATE TYPE "public"."enum__pages_v_version_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum__posts_v_version_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_advance_history_status" AS ENUM('pending', 'approved', 'rejected', 'disbursed', 'completed');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_advance_settings_risk_category" AS ENUM('lowRisk', 'mediumRisk', 'highRisk');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_auth_provider" AS ENUM('local', 'google', 'facebook');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_bank_details_account_type" AS ENUM('savings', 'checking', 'payroll');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_documents_document_type" AS ENUM('id', 'contract', 'other');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_employment_status" AS ENUM('regular', 'probationary', 'contract', 'part_time');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_employment_type" AS ENUM('full_time', 'part_time', 'contract');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_marital_status" AS ENUM('single', 'married', 'widowed', 'divorced');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_membership_tier" AS ENUM('bronze', 'silver', 'gold', 'platinum');--> statement-breakpoint
CREATE TYPE "public"."enum_employees_status" AS ENUM('pending', 'active', 'suspended');--> statement-breakpoint
CREATE TYPE "public"."enum_employers_auth_provider" AS ENUM('local', 'google', 'facebook');--> statement-breakpoint
CREATE TYPE "public"."enum_employers_business_type" AS ENUM('corporation', 'partnership', 'soleProprietorship');--> statement-breakpoint
CREATE TYPE "public"."enum_employers_payroll_settings_payroll_cycle" AS ENUM('monthly', 'semi_monthly', 'weekly', 'bi_weekly');--> statement-breakpoint
CREATE TYPE "public"."enum_employers_risk_assessment_risk_category" AS ENUM('lowRisk', 'mediumRisk', 'highRisk');--> statement-breakpoint
CREATE TYPE "public"."enum_employers_risk_profile_risk_rating" AS ENUM('AAA', 'AA', 'A', 'BBB', 'BB', 'B', 'CCC', 'CC', 'C', 'D');--> statement-breakpoint
CREATE TYPE "public"."enum_employers_status" AS ENUM('active', 'inactive', 'suspended');--> statement-breakpoint
CREATE TYPE "public"."enum_factoring_calculations_risk_category" AS ENUM('lowRisk', 'mediumRisk', 'highRisk');--> statement-breakpoint
CREATE TYPE "public"."enum_factoring_repayments_late_fees_fee_type" AS ENUM('fixed', 'percentage');--> statement-breakpoint
CREATE TYPE "public"."enum_factoring_repayments_payment_history_payment_method" AS ENUM('bank', 'debit', 'check');--> statement-breakpoint
CREATE TYPE "public"."enum_factoring_repayments_payment_status" AS ENUM('pending', 'paid', 'overdue', 'defaulted', 'partially_paid');--> statement-breakpoint
CREATE TYPE "public"."enum_footer_nav_items_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_forms_confirmation_type" AS ENUM('message', 'redirect');--> statement-breakpoint
CREATE TYPE "public"."enum_header_nav_items_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_archive_populate_by" AS ENUM('collection', 'selection');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_archive_relation_to" AS ENUM('posts');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_content_columns_link_appearance" AS ENUM('default', 'outline');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_content_columns_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_content_columns_size" AS ENUM('oneThird', 'half', 'twoThirds', 'full');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_cta_links_link_appearance" AS ENUM('default', 'outline');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_blocks_cta_links_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_hero_links_link_appearance" AS ENUM('default', 'outline');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_hero_links_link_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_hero_type" AS ENUM('none', 'highImpact', 'mediumImpact', 'lowImpact');--> statement-breakpoint
CREATE TYPE "public"."enum_pages_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_payload_jobs_log_state" AS ENUM('failed', 'succeeded');--> statement-breakpoint
CREATE TYPE "public"."enum_payload_jobs_log_task_slug" AS ENUM('inline', 'schedulePublish');--> statement-breakpoint
CREATE TYPE "public"."enum_payload_jobs_task_slug" AS ENUM('inline', 'schedulePublish');--> statement-breakpoint
CREATE TYPE "public"."enum_payroll_advances_membership_tier" AS ENUM('bronze', 'silver', 'gold', 'platinum');--> statement-breakpoint
CREATE TYPE "public"."enum_payroll_advances_status" AS ENUM('requested', 'approved', 'disbursed', 'repaid', 'defaulted');--> statement-breakpoint
CREATE TYPE "public"."enum_payroll_transactions_fees_fee_type" AS ENUM('processing', 'wire', 'late', 'other');--> statement-breakpoint
CREATE TYPE "public"."enum_payroll_transactions_payment_status" AS ENUM('processing', 'completed', 'failed', 'pending', 'cancelled');--> statement-breakpoint
CREATE TYPE "public"."enum_payroll_transactions_reconciliation_status" AS ENUM('pending', 'matched', 'unmatched', 'reconciled');--> statement-breakpoint
CREATE TYPE "public"."enum_payroll_transactions_transaction_type" AS ENUM('disbursement', 'repayment', 'fee');--> statement-breakpoint
CREATE TYPE "public"."enum_posts_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_redirects_to_type" AS ENUM('reference', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_users_auth_provider" AS ENUM('local', 'google', 'facebook');--> statement-breakpoint
CREATE TYPE "public"."enum_users_investment_details_profit_distribution_type" AS ENUM('fixed', 'variable');--> statement-breakpoint
CREATE TYPE "public"."enum_users_last_repayment_status" AS ENUM('ontime', 'late', 'default');--> statement-breakpoint
CREATE TYPE "public"."enum_users_membership_tier" AS ENUM('bronze', 'silver', 'gold', 'platinum');--> statement-breakpoint
CREATE TYPE "public"."enum_users_permissions" AS ENUM('payroll_access', 'payroll_admin');--> statement-breakpoint
CREATE TYPE "public"."enum_users_role" AS ENUM('admin', 'staff', 'employer', 'employee', 'user');--> statement-breakpoint
CREATE TYPE "public"."enum_users_status" AS ENUM('active', 'inactive', 'suspended');--> statement-breakpoint
CREATE TABLE "_pages_v" (
	"id" serial PRIMARY KEY NOT NULL,
	"parent_id" integer,
	"version_title" varchar,
	"version_hero_type" "enum__pages_v_version_hero_type" DEFAULT 'lowImpact',
	"version_hero_rich_text" jsonb,
	"version_hero_media_id" integer,
	"version_meta_title" varchar,
	"version_meta_image_id" integer,
	"version_meta_description" varchar,
	"version_published_at" timestamp(3) with time zone,
	"version_slug" varchar,
	"version_slug_lock" boolean DEFAULT true,
	"version_updated_at" timestamp(3) with time zone,
	"version_created_at" timestamp(3) with time zone,
	"version__status" "enum__pages_v_version_status" DEFAULT 'draft',
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"latest" boolean,
	"autosave" boolean
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_archive" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"intro_content" jsonb,
	"populate_by" "enum__pages_v_blocks_archive_populate_by" DEFAULT 'collection',
	"relation_to" "enum__pages_v_blocks_archive_relation_to" DEFAULT 'posts',
	"limit" numeric DEFAULT '10',
	"_uuid" varchar,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_content" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"_uuid" varchar,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_content_columns" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"size" "enum__pages_v_blocks_content_columns_size" DEFAULT 'oneThird',
	"rich_text" jsonb,
	"enable_link" boolean,
	"link_type" "enum__pages_v_blocks_content_columns_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar,
	"link_appearance" "enum__pages_v_blocks_content_columns_link_appearance" DEFAULT 'default',
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_cta" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"rich_text" jsonb,
	"_uuid" varchar,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_cta_links" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"link_type" "enum__pages_v_blocks_cta_links_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar,
	"link_appearance" "enum__pages_v_blocks_cta_links_link_appearance" DEFAULT 'default',
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_form_block" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"form_id" integer,
	"enable_intro" boolean,
	"intro_content" jsonb,
	"_uuid" varchar,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_blocks_media_block" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"media_id" integer,
	"_uuid" varchar,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "_pages_v_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"pages_id" integer,
	"posts_id" integer,
	"categories_id" integer
);
--> statement-breakpoint
CREATE TABLE "_pages_v_version_hero_links" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"link_type" "enum__pages_v_version_hero_links_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar,
	"link_appearance" "enum__pages_v_version_hero_links_link_appearance" DEFAULT 'default',
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "_posts_v" (
	"id" serial PRIMARY KEY NOT NULL,
	"parent_id" integer,
	"version_title" varchar,
	"version_hero_image_id" integer,
	"version_content" jsonb,
	"version_meta_title" varchar,
	"version_meta_image_id" integer,
	"version_meta_description" varchar,
	"version_published_at" timestamp(3) with time zone,
	"version_slug" varchar,
	"version_slug_lock" boolean DEFAULT true,
	"version_updated_at" timestamp(3) with time zone,
	"version_created_at" timestamp(3) with time zone,
	"version__status" "enum__posts_v_version_status" DEFAULT 'draft',
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"latest" boolean,
	"autosave" boolean
);
--> statement-breakpoint
CREATE TABLE "_posts_v_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"posts_id" integer,
	"categories_id" integer,
	"users_id" integer
);
--> statement-breakpoint
CREATE TABLE "_posts_v_version_populated_authors" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"_uuid" varchar,
	"name" varchar
);
--> statement-breakpoint
CREATE TABLE "categories" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"description" varchar,
	"slug" varchar,
	"slug_lock" boolean DEFAULT true,
	"company_u_u_i_d" varchar NOT NULL,
	"active" boolean DEFAULT true,
	"parent_id" integer,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "categories_breadcrumbs" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"doc_id" integer,
	"url" varchar,
	"label" varchar
);
--> statement-breakpoint
CREATE TABLE "employees" (
	"id" serial PRIMARY KEY NOT NULL,
	"employee_uuid" varchar NOT NULL,
	"user_id_id" integer NOT NULL,
	"employer_id_id" integer NOT NULL,
	"employee_id" varchar NOT NULL,
	"first_name" varchar NOT NULL,
	"middle_name" varchar,
	"last_name" varchar NOT NULL,
	"suffixes" varchar,
	"full_name" varchar NOT NULL,
	"date_of_birth" timestamp(3) with time zone NOT NULL,
	"marital_status" "enum_employees_marital_status" NOT NULL,
	"mobile_number" varchar NOT NULL,
	"address_street" varchar NOT NULL,
	"address_barangay" varchar NOT NULL,
	"address_city_district" varchar NOT NULL,
	"address_province" varchar NOT NULL,
	"address_zip_code" varchar NOT NULL,
	"employer_profile_id" integer,
	"company_u_u_i_d_id" integer NOT NULL,
	"department" varchar NOT NULL,
	"position" varchar NOT NULL,
	"employment_type" "enum_employees_employment_type" NOT NULL,
	"employment_status" "enum_employees_employment_status" NOT NULL,
	"job_title" varchar NOT NULL,
	"basic_monthly_pay_net" numeric NOT NULL,
	"payment_details_bank_name" varchar NOT NULL,
	"payment_details_account_number" varchar NOT NULL,
	"salary" numeric NOT NULL,
	"start_date" timestamp(3) with time zone NOT NULL,
	"advance_settings_advance_limit" numeric DEFAULT '30' NOT NULL,
	"advance_settings_credit_score" numeric,
	"advance_settings_risk_category" "enum_employees_advance_settings_risk_category",
	"bank_details_bank_name" varchar NOT NULL,
	"bank_details_account_number" varchar NOT NULL,
	"bank_details_account_name" varchar NOT NULL,
	"bank_details_account_type" "enum_employees_bank_details_account_type" NOT NULL,
	"auth_provider" "enum_employees_auth_provider" DEFAULT 'local' NOT NULL,
	"google_id" varchar,
	"facebook_id" varchar,
	"status" "enum_employees_status" DEFAULT 'pending' NOT NULL,
	"last_login" timestamp(3) with time zone,
	"employment_duration" numeric,
	"performance_score" numeric,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"loan_access_is_approved" boolean DEFAULT false,
	"loan_access_approved_by_id" integer,
	"loan_access_approval_date" timestamp(3) with time zone,
	"loan_access_credit_score" numeric,
	"membership_tier" "enum_employees_membership_tier" NOT NULL,
	"enable_a_p_i_key" boolean,
	"api_key" varchar,
	"api_key_index" varchar,
	"email" varchar NOT NULL,
	"reset_password_token" varchar,
	"reset_password_expiration" timestamp(3) with time zone,
	"salt" varchar,
	"hash" varchar,
	"login_attempts" numeric DEFAULT '0',
	"lock_until" timestamp(3) with time zone
);
--> statement-breakpoint
CREATE TABLE "employees_advance_history" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"advance_id_id" integer,
	"amount" numeric,
	"date" timestamp(3) with time zone,
	"status" "enum_employees_advance_history_status"
);
--> statement-breakpoint
CREATE TABLE "employees_documents" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"file_id" integer NOT NULL,
	"document_type" "enum_employees_documents_document_type",
	"description" varchar
);
--> statement-breakpoint
CREATE TABLE "employers" (
	"id" serial PRIMARY KEY NOT NULL,
	"auth_provider" "enum_employers_auth_provider" DEFAULT 'local' NOT NULL,
	"google_id" varchar,
	"facebook_id" varchar,
	"avatar_id" integer,
	"user_id_id" integer NOT NULL,
	"company_name" varchar NOT NULL,
	"company_u_u_i_d" varchar,
	"registration_number" varchar NOT NULL,
	"phone_number" varchar NOT NULL,
	"address_street" varchar NOT NULL,
	"address_barangay" varchar NOT NULL,
	"address_city_district" varchar NOT NULL,
	"address_province" varchar NOT NULL,
	"address_zip_code" varchar NOT NULL,
	"business_type" "enum_employers_business_type" NOT NULL,
	"industry" varchar NOT NULL,
	"payroll_provider" varchar,
	"status" "enum_employers_status" DEFAULT 'active',
	"last_login" timestamp(3) with time zone,
	"payroll_settings_payroll_cycle" "enum_employers_payroll_settings_payroll_cycle" NOT NULL,
	"factoring_agreement_signed" boolean DEFAULT false,
	"credit_limit" numeric NOT NULL,
	"bank_details_bank_name" varchar NOT NULL,
	"bank_details_account_number" varchar NOT NULL,
	"bank_details_account_name" varchar NOT NULL,
	"risk_assessment_credit_score" numeric,
	"risk_assessment_risk_category" "enum_employers_risk_assessment_risk_category",
	"risk_profile_credit_limit" numeric DEFAULT '0' NOT NULL,
	"risk_profile_risk_rating" "enum_employers_risk_profile_risk_rating",
	"risk_profile_risk_score" numeric,
	"risk_profile_last_assessment_date" timestamp(3) with time zone,
	"risk_metrics_default_probability" numeric,
	"risk_metrics_loss_given_default" numeric,
	"risk_metrics_exposure_at_default" numeric,
	"risk_metrics_expected_credit_loss" numeric,
	"factoring_settings_enabled" boolean DEFAULT false,
	"factoring_settings_max_advance_percentage" numeric DEFAULT '90',
	"factoring_settings_default_tenure_days" numeric DEFAULT '14',
	"factoring_settings_min_days_between_advances" numeric DEFAULT '7',
	"factoring_stats_total_advance_amount" numeric DEFAULT '0',
	"factoring_stats_outstanding_advances" numeric DEFAULT '0',
	"factoring_stats_average_repayment_time" numeric DEFAULT '0',
	"factoring_stats_last_advance_date" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"enable_a_p_i_key" boolean,
	"api_key" varchar,
	"api_key_index" varchar,
	"email" varchar NOT NULL,
	"reset_password_token" varchar,
	"reset_password_expiration" timestamp(3) with time zone,
	"salt" varchar,
	"hash" varchar,
	"login_attempts" numeric DEFAULT '0',
	"lock_until" timestamp(3) with time zone
);
--> statement-breakpoint
CREATE TABLE "employers_payroll_settings_payroll_dates" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"date" numeric NOT NULL
);
--> statement-breakpoint
CREATE TABLE "factoring_calculations" (
	"id" serial PRIMARY KEY NOT NULL,
	"advance_id" varchar NOT NULL,
	"employer_id_id" integer NOT NULL,
	"payroll_id_id" integer NOT NULL,
	"risk_score" numeric,
	"risk_category" "enum_factoring_calculations_risk_category",
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "factoring_repayments" (
	"id" serial PRIMARY KEY NOT NULL,
	"repayment_id" varchar NOT NULL,
	"advance_id_id" integer NOT NULL,
	"company_u_u_i_d_id" integer NOT NULL,
	"scheduled_payment_date" timestamp(3) with time zone NOT NULL,
	"actual_payment_date" timestamp(3) with time zone,
	"total_amount_due" numeric NOT NULL,
	"total_amount_paid" numeric DEFAULT '0',
	"payment_status" "enum_factoring_repayments_payment_status" DEFAULT 'pending' NOT NULL,
	"amount_due_principal" numeric NOT NULL,
	"amount_due_interest" numeric NOT NULL,
	"amount_due_fees" numeric DEFAULT '0',
	"amount_paid_principal" numeric DEFAULT '0',
	"amount_paid_interest" numeric DEFAULT '0',
	"amount_paid_fees" numeric DEFAULT '0',
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "factoring_repayments_late_fees" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"fee_date" timestamp(3) with time zone NOT NULL,
	"fee_type" "enum_factoring_repayments_late_fees_fee_type" NOT NULL,
	"fee_amount" numeric NOT NULL,
	"paid" boolean DEFAULT false
);
--> statement-breakpoint
CREATE TABLE "factoring_repayments_payment_history" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"payment_date" timestamp(3) with time zone NOT NULL,
	"amount" numeric NOT NULL,
	"payment_method" "enum_factoring_repayments_payment_history_payment_method" NOT NULL,
	"reference_number" varchar
);
--> statement-breakpoint
CREATE TABLE "footer" (
	"id" serial PRIMARY KEY NOT NULL,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
);
--> statement-breakpoint
CREATE TABLE "footer_nav_items" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"link_type" "enum_footer_nav_items_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE "footer_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"pages_id" integer,
	"posts_id" integer
);
--> statement-breakpoint
CREATE TABLE "form_submissions" (
	"id" serial PRIMARY KEY NOT NULL,
	"form_id" integer NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "form_submissions_submission_data" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"field" varchar NOT NULL,
	"value" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE "forms" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar NOT NULL,
	"submit_button_label" varchar,
	"confirmation_type" "enum_forms_confirmation_type" DEFAULT 'message',
	"confirmation_message" jsonb,
	"redirect_url" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_checkbox" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"required" boolean,
	"default_value" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_country" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_email" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_message" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"message" jsonb,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_number" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"default_value" numeric,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_select" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"default_value" varchar,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_select_options" (
	"_order" integer NOT NULL,
	"_parent_id" varchar NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"label" varchar NOT NULL,
	"value" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_state" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_text" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"default_value" varchar,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_blocks_textarea" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar,
	"width" numeric,
	"default_value" varchar,
	"required" boolean,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "forms_emails" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"email_to" varchar,
	"cc" varchar,
	"bcc" varchar,
	"reply_to" varchar,
	"email_from" varchar,
	"subject" varchar DEFAULT 'You''''ve received a new message.' NOT NULL,
	"message" jsonb
);
--> statement-breakpoint
CREATE TABLE "header" (
	"id" serial PRIMARY KEY NOT NULL,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
);
--> statement-breakpoint
CREATE TABLE "header_nav_items" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"link_type" "enum_header_nav_items_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE "header_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"pages_id" integer,
	"posts_id" integer
);
--> statement-breakpoint
CREATE TABLE "media" (
	"id" serial PRIMARY KEY NOT NULL,
	"alt" varchar NOT NULL,
	"caption" jsonb,
	"company_u_u_i_d" varchar NOT NULL,
	"prefix" varchar DEFAULT 'media',
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"url" varchar,
	"thumbnail_u_r_l" varchar,
	"filename" varchar,
	"mime_type" varchar,
	"filesize" numeric,
	"width" numeric,
	"height" numeric,
	"focal_x" numeric,
	"focal_y" numeric,
	"sizes_thumbnail_url" varchar,
	"sizes_thumbnail_width" numeric,
	"sizes_thumbnail_height" numeric,
	"sizes_thumbnail_mime_type" varchar,
	"sizes_thumbnail_filesize" numeric,
	"sizes_thumbnail_filename" varchar,
	"sizes_square_url" varchar,
	"sizes_square_width" numeric,
	"sizes_square_height" numeric,
	"sizes_square_mime_type" varchar,
	"sizes_square_filesize" numeric,
	"sizes_square_filename" varchar,
	"sizes_small_url" varchar,
	"sizes_small_width" numeric,
	"sizes_small_height" numeric,
	"sizes_small_mime_type" varchar,
	"sizes_small_filesize" numeric,
	"sizes_small_filename" varchar,
	"sizes_medium_url" varchar,
	"sizes_medium_width" numeric,
	"sizes_medium_height" numeric,
	"sizes_medium_mime_type" varchar,
	"sizes_medium_filesize" numeric,
	"sizes_medium_filename" varchar,
	"sizes_large_url" varchar,
	"sizes_large_width" numeric,
	"sizes_large_height" numeric,
	"sizes_large_mime_type" varchar,
	"sizes_large_filesize" numeric,
	"sizes_large_filename" varchar,
	"sizes_xlarge_url" varchar,
	"sizes_xlarge_width" numeric,
	"sizes_xlarge_height" numeric,
	"sizes_xlarge_mime_type" varchar,
	"sizes_xlarge_filesize" numeric,
	"sizes_xlarge_filename" varchar,
	"sizes_og_url" varchar,
	"sizes_og_width" numeric,
	"sizes_og_height" numeric,
	"sizes_og_mime_type" varchar,
	"sizes_og_filesize" numeric,
	"sizes_og_filename" varchar
);
--> statement-breakpoint
CREATE TABLE "pages" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"hero_type" "enum_pages_hero_type" DEFAULT 'lowImpact',
	"hero_rich_text" jsonb,
	"hero_media_id" integer,
	"meta_title" varchar,
	"meta_image_id" integer,
	"meta_description" varchar,
	"published_at" timestamp(3) with time zone,
	"slug" varchar,
	"slug_lock" boolean DEFAULT true,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"_status" "enum_pages_status" DEFAULT 'draft'
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_archive" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"intro_content" jsonb,
	"populate_by" "enum_pages_blocks_archive_populate_by" DEFAULT 'collection',
	"relation_to" "enum_pages_blocks_archive_relation_to" DEFAULT 'posts',
	"limit" numeric DEFAULT '10',
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_content" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_content_columns" (
	"_order" integer NOT NULL,
	"_parent_id" varchar NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"size" "enum_pages_blocks_content_columns_size" DEFAULT 'oneThird',
	"rich_text" jsonb,
	"enable_link" boolean,
	"link_type" "enum_pages_blocks_content_columns_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar,
	"link_appearance" "enum_pages_blocks_content_columns_link_appearance" DEFAULT 'default'
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_cta" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"rich_text" jsonb,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_cta_links" (
	"_order" integer NOT NULL,
	"_parent_id" varchar NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"link_type" "enum_pages_blocks_cta_links_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar,
	"link_appearance" "enum_pages_blocks_cta_links_link_appearance" DEFAULT 'default'
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_form_block" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"form_id" integer,
	"enable_intro" boolean,
	"intro_content" jsonb,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "pages_blocks_media_block" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"_path" text NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"media_id" integer,
	"block_name" varchar
);
--> statement-breakpoint
CREATE TABLE "pages_hero_links" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"link_type" "enum_pages_hero_links_link_type" DEFAULT 'reference',
	"link_new_tab" boolean,
	"link_url" varchar,
	"link_label" varchar,
	"link_appearance" "enum_pages_hero_links_link_appearance" DEFAULT 'default'
);
--> statement-breakpoint
CREATE TABLE "pages_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"pages_id" integer,
	"posts_id" integer,
	"categories_id" integer
);
--> statement-breakpoint
CREATE TABLE "payload_jobs" (
	"id" serial PRIMARY KEY NOT NULL,
	"input" jsonb,
	"completed_at" timestamp(3) with time zone,
	"total_tried" numeric DEFAULT '0',
	"has_error" boolean DEFAULT false,
	"error" jsonb,
	"task_slug" "enum_payload_jobs_task_slug",
	"queue" varchar DEFAULT 'default',
	"wait_until" timestamp(3) with time zone,
	"processing" boolean DEFAULT false,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payload_jobs_log" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"executed_at" timestamp(3) with time zone NOT NULL,
	"completed_at" timestamp(3) with time zone NOT NULL,
	"task_slug" "enum_payload_jobs_log_task_slug" NOT NULL,
	"task_i_d" varchar NOT NULL,
	"input" jsonb,
	"output" jsonb,
	"state" "enum_payload_jobs_log_state" NOT NULL,
	"error" jsonb
);
--> statement-breakpoint
CREATE TABLE "payload_locked_documents" (
	"id" serial PRIMARY KEY NOT NULL,
	"global_slug" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payload_locked_documents_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"pages_id" integer,
	"posts_id" integer,
	"media_id" integer,
	"categories_id" integer,
	"users_id" integer,
	"employers_id" integer,
	"employees_id" integer,
	"payroll_advances_id" integer,
	"payroll_repayments_id" integer,
	"payrolls_id" integer,
	"payroll_transactions_id" integer,
	"factoring_calculations_id" integer,
	"factoring_repayments_id" integer,
	"payroll_factoring_id" integer,
	"redirects_id" integer,
	"forms_id" integer,
	"form_submissions_id" integer,
	"search_id" integer,
	"payload_jobs_id" integer
);
--> statement-breakpoint
CREATE TABLE "payload_migrations" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar,
	"batch" numeric,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payload_preferences" (
	"id" serial PRIMARY KEY NOT NULL,
	"key" varchar,
	"value" jsonb,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payload_preferences_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"users_id" integer,
	"employers_id" integer,
	"employees_id" integer
);
--> statement-breakpoint
CREATE TABLE "payroll_advances" (
	"id" serial PRIMARY KEY NOT NULL,
	"advance_id" varchar NOT NULL,
	"employee_id_id" integer NOT NULL,
	"company_u_u_i_d_id" integer NOT NULL,
	"requested_amount" numeric NOT NULL,
	"approved_amount" numeric,
	"processing_fee" numeric NOT NULL,
	"net_disbursement_amount" numeric,
	"working_days_completed" numeric NOT NULL,
	"earned_salary_amount" numeric NOT NULL,
	"repayment_due_date" timestamp(3) with time zone NOT NULL,
	"status" "enum_payroll_advances_status" DEFAULT 'requested' NOT NULL,
	"request_date" timestamp(3) with time zone NOT NULL,
	"approval_date" timestamp(3) with time zone,
	"disbursement_date" timestamp(3) with time zone,
	"created_by_id" integer NOT NULL,
	"last_updated_by_id" integer,
	"membership_tier" "enum_payroll_advances_membership_tier" NOT NULL,
	"payroll_period_start_date" timestamp(3) with time zone NOT NULL,
	"payroll_period_end_date" timestamp(3) with time zone NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payroll_factoring" (
	"id" serial PRIMARY KEY NOT NULL,
	"factor_u_u_i_d" varchar NOT NULL,
	"company_u_u_i_d_id" integer NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payroll_repayments" (
	"id" serial PRIMARY KEY NOT NULL,
	"repayment_id" varchar NOT NULL,
	"advance_id_id" integer NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payroll_transactions" (
	"id" serial PRIMARY KEY NOT NULL,
	"transaction_id" varchar NOT NULL,
	"company_u_u_i_d_id" integer NOT NULL,
	"employee_id_id" integer NOT NULL,
	"advance_id_id" integer,
	"repayment_id_id" integer,
	"transaction_date" timestamp(3) with time zone NOT NULL,
	"transaction_type" "enum_payroll_transactions_transaction_type" NOT NULL,
	"amount" numeric NOT NULL,
	"payment_status" "enum_payroll_transactions_payment_status" DEFAULT 'processing' NOT NULL,
	"bank_details_bank_name" varchar,
	"bank_details_account_number" varchar,
	"bank_details_routing_number" varchar,
	"bank_details_reference_number" varchar,
	"reconciliation_status" "enum_payroll_transactions_reconciliation_status" DEFAULT 'pending',
	"metadata_initiated_by_id" integer,
	"metadata_approved_by_id" integer,
	"metadata_notes" varchar,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payroll_transactions_fees" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"fee_type" "enum_payroll_transactions_fees_fee_type" NOT NULL,
	"amount" numeric NOT NULL,
	"description" varchar
);
--> statement-breakpoint
CREATE TABLE "payroll_transactions_metadata_attachments" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"file_id" integer,
	"description" varchar
);
--> statement-breakpoint
CREATE TABLE "payrolls" (
	"id" serial PRIMARY KEY NOT NULL,
	"payroll_id" varchar NOT NULL,
	"employer_id_id" integer NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "posts" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"hero_image_id" integer,
	"content" jsonb,
	"meta_title" varchar,
	"meta_image_id" integer,
	"meta_description" varchar,
	"published_at" timestamp(3) with time zone,
	"slug" varchar,
	"slug_lock" boolean DEFAULT true,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"_status" "enum_posts_status" DEFAULT 'draft'
);
--> statement-breakpoint
CREATE TABLE "posts_populated_authors" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"name" varchar
);
--> statement-breakpoint
CREATE TABLE "posts_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"posts_id" integer,
	"categories_id" integer,
	"users_id" integer
);
--> statement-breakpoint
CREATE TABLE "redirects" (
	"id" serial PRIMARY KEY NOT NULL,
	"from" varchar NOT NULL,
	"to_type" "enum_redirects_to_type" DEFAULT 'reference',
	"to_url" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "redirects_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"pages_id" integer,
	"posts_id" integer
);
--> statement-breakpoint
CREATE TABLE "search" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"priority" numeric,
	"slug" varchar,
	"meta_title" varchar,
	"meta_description" varchar,
	"meta_image_id" integer,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "search_categories" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"relation_to" varchar,
	"title" varchar
);
--> statement-breakpoint
CREATE TABLE "search_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"posts_id" integer
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" varchar NOT NULL,
	"name" varchar NOT NULL,
	"role" "enum_users_role" NOT NULL,
	"status" "enum_users_status" DEFAULT 'active',
	"company_u_u_i_d" varchar,
	"last_login" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"employee_profile_id" integer,
	"employer_profile_id" integer,
	"investment_details_total_investment" numeric DEFAULT '0',
	"investment_details_expected_return_rate" numeric,
	"investment_details_profit_distribution_type" "enum_users_investment_details_profit_distribution_type",
	"membership_tier" "enum_users_membership_tier" DEFAULT 'bronze',
	"advance_limit" numeric DEFAULT '30',
	"previous_defaults" numeric DEFAULT '0',
	"last_repayment_status" "enum_users_last_repayment_status",
	"auth_provider" "enum_users_auth_provider" DEFAULT 'local' NOT NULL,
	"mobile_number" varchar,
	"welcome_email_sent" boolean DEFAULT false,
	"email" varchar NOT NULL,
	"reset_password_token" varchar,
	"reset_password_expiration" timestamp(3) with time zone,
	"salt" varchar,
	"hash" varchar,
	"_verified" boolean,
	"_verificationtoken" varchar,
	"login_attempts" numeric DEFAULT '0',
	"lock_until" timestamp(3) with time zone
);
--> statement-breakpoint
CREATE TABLE "users_permissions" (
	"order" integer NOT NULL,
	"parent_id" integer NOT NULL,
	"value" "enum_users_permissions",
	"id" serial PRIMARY KEY NOT NULL
);
--> statement-breakpoint
ALTER TABLE "_pages_v" ADD CONSTRAINT "_pages_v_parent_id_pages_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."pages"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v" ADD CONSTRAINT "_pages_v_version_hero_media_id_media_id_fk" FOREIGN KEY ("version_hero_media_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v" ADD CONSTRAINT "_pages_v_version_meta_image_id_media_id_fk" FOREIGN KEY ("version_meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_archive" ADD CONSTRAINT "_pages_v_blocks_archive_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_content" ADD CONSTRAINT "_pages_v_blocks_content_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_content_columns" ADD CONSTRAINT "_pages_v_blocks_content_columns_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v_blocks_content"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_cta" ADD CONSTRAINT "_pages_v_blocks_cta_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_cta_links" ADD CONSTRAINT "_pages_v_blocks_cta_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v_blocks_cta"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_form_block" ADD CONSTRAINT "_pages_v_blocks_form_block_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_form_block" ADD CONSTRAINT "_pages_v_blocks_form_block_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_media_block" ADD CONSTRAINT "_pages_v_blocks_media_block_media_id_media_id_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_blocks_media_block" ADD CONSTRAINT "_pages_v_blocks_media_block_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_pages_v_version_hero_links" ADD CONSTRAINT "_pages_v_version_hero_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v" ADD CONSTRAINT "_posts_v_parent_id_posts_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."posts"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v" ADD CONSTRAINT "_posts_v_version_hero_image_id_media_id_fk" FOREIGN KEY ("version_hero_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v" ADD CONSTRAINT "_posts_v_version_meta_image_id_media_id_fk" FOREIGN KEY ("version_meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_posts_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_posts_v_version_populated_authors" ADD CONSTRAINT "_posts_v_version_populated_authors_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_posts_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "categories" ADD CONSTRAINT "categories_parent_id_categories_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."categories"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "categories_breadcrumbs" ADD CONSTRAINT "categories_breadcrumbs_doc_id_categories_id_fk" FOREIGN KEY ("doc_id") REFERENCES "public"."categories"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "categories_breadcrumbs" ADD CONSTRAINT "categories_breadcrumbs_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees" ADD CONSTRAINT "employees_user_id_id_users_id_fk" FOREIGN KEY ("user_id_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees" ADD CONSTRAINT "employees_employer_id_id_employers_id_fk" FOREIGN KEY ("employer_id_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees" ADD CONSTRAINT "employees_employer_profile_id_employers_id_fk" FOREIGN KEY ("employer_profile_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees" ADD CONSTRAINT "employees_company_u_u_i_d_id_employers_id_fk" FOREIGN KEY ("company_u_u_i_d_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees" ADD CONSTRAINT "employees_loan_access_approved_by_id_users_id_fk" FOREIGN KEY ("loan_access_approved_by_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees_advance_history" ADD CONSTRAINT "employees_advance_history_advance_id_id_payroll_advances_id_fk" FOREIGN KEY ("advance_id_id") REFERENCES "public"."payroll_advances"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees_advance_history" ADD CONSTRAINT "employees_advance_history_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."employees"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees_documents" ADD CONSTRAINT "employees_documents_file_id_media_id_fk" FOREIGN KEY ("file_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employees_documents" ADD CONSTRAINT "employees_documents_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."employees"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employers" ADD CONSTRAINT "employers_avatar_id_media_id_fk" FOREIGN KEY ("avatar_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employers" ADD CONSTRAINT "employers_user_id_id_users_id_fk" FOREIGN KEY ("user_id_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "employers_payroll_settings_payroll_dates" ADD CONSTRAINT "employers_payroll_settings_payroll_dates_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."employers"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "factoring_calculations" ADD CONSTRAINT "factoring_calculations_employer_id_id_employers_id_fk" FOREIGN KEY ("employer_id_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "factoring_calculations" ADD CONSTRAINT "factoring_calculations_payroll_id_id_payrolls_id_fk" FOREIGN KEY ("payroll_id_id") REFERENCES "public"."payrolls"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "factoring_repayments" ADD CONSTRAINT "factoring_repayments_advance_id_id_factoring_calculations_id_fk" FOREIGN KEY ("advance_id_id") REFERENCES "public"."factoring_calculations"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "factoring_repayments" ADD CONSTRAINT "factoring_repayments_company_u_u_i_d_id_employers_id_fk" FOREIGN KEY ("company_u_u_i_d_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "factoring_repayments_late_fees" ADD CONSTRAINT "factoring_repayments_late_fees_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."factoring_repayments"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "factoring_repayments_payment_history" ADD CONSTRAINT "factoring_repayments_payment_history_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."factoring_repayments"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "footer_nav_items" ADD CONSTRAINT "footer_nav_items_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."footer"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "footer_rels" ADD CONSTRAINT "footer_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."footer"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "footer_rels" ADD CONSTRAINT "footer_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "footer_rels" ADD CONSTRAINT "footer_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "form_submissions" ADD CONSTRAINT "form_submissions_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "form_submissions_submission_data" ADD CONSTRAINT "form_submissions_submission_data_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."form_submissions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_checkbox" ADD CONSTRAINT "forms_blocks_checkbox_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_country" ADD CONSTRAINT "forms_blocks_country_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_email" ADD CONSTRAINT "forms_blocks_email_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_message" ADD CONSTRAINT "forms_blocks_message_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_number" ADD CONSTRAINT "forms_blocks_number_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_select" ADD CONSTRAINT "forms_blocks_select_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_select_options" ADD CONSTRAINT "forms_blocks_select_options_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_select"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_state" ADD CONSTRAINT "forms_blocks_state_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_text" ADD CONSTRAINT "forms_blocks_text_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_blocks_textarea" ADD CONSTRAINT "forms_blocks_textarea_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "forms_emails" ADD CONSTRAINT "forms_emails_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "header_nav_items" ADD CONSTRAINT "header_nav_items_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "header_rels" ADD CONSTRAINT "header_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."header"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "header_rels" ADD CONSTRAINT "header_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "header_rels" ADD CONSTRAINT "header_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages" ADD CONSTRAINT "pages_hero_media_id_media_id_fk" FOREIGN KEY ("hero_media_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages" ADD CONSTRAINT "pages_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_archive" ADD CONSTRAINT "pages_blocks_archive_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_content" ADD CONSTRAINT "pages_blocks_content_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_content_columns" ADD CONSTRAINT "pages_blocks_content_columns_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages_blocks_content"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_cta" ADD CONSTRAINT "pages_blocks_cta_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_cta_links" ADD CONSTRAINT "pages_blocks_cta_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages_blocks_cta"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_form_block" ADD CONSTRAINT "pages_blocks_form_block_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_form_block" ADD CONSTRAINT "pages_blocks_form_block_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_media_block" ADD CONSTRAINT "pages_blocks_media_block_media_id_media_id_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_blocks_media_block" ADD CONSTRAINT "pages_blocks_media_block_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_hero_links" ADD CONSTRAINT "pages_hero_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_jobs_log" ADD CONSTRAINT "payload_jobs_log_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."payload_jobs"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_locked_documents"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_employers_fk" FOREIGN KEY ("employers_id") REFERENCES "public"."employers"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_employees_fk" FOREIGN KEY ("employees_id") REFERENCES "public"."employees"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payroll_advances_fk" FOREIGN KEY ("payroll_advances_id") REFERENCES "public"."payroll_advances"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payroll_repayments_fk" FOREIGN KEY ("payroll_repayments_id") REFERENCES "public"."payroll_repayments"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payrolls_fk" FOREIGN KEY ("payrolls_id") REFERENCES "public"."payrolls"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payroll_transactions_fk" FOREIGN KEY ("payroll_transactions_id") REFERENCES "public"."payroll_transactions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_factoring_calculations_fk" FOREIGN KEY ("factoring_calculations_id") REFERENCES "public"."factoring_calculations"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_factoring_repayments_fk" FOREIGN KEY ("factoring_repayments_id") REFERENCES "public"."factoring_repayments"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payroll_factoring_fk" FOREIGN KEY ("payroll_factoring_id") REFERENCES "public"."payroll_factoring"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_redirects_fk" FOREIGN KEY ("redirects_id") REFERENCES "public"."redirects"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_forms_fk" FOREIGN KEY ("forms_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_form_submissions_fk" FOREIGN KEY ("form_submissions_id") REFERENCES "public"."form_submissions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_search_fk" FOREIGN KEY ("search_id") REFERENCES "public"."search"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payload_jobs_fk" FOREIGN KEY ("payload_jobs_id") REFERENCES "public"."payload_jobs"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_preferences"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_employers_fk" FOREIGN KEY ("employers_id") REFERENCES "public"."employers"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_employees_fk" FOREIGN KEY ("employees_id") REFERENCES "public"."employees"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_advances" ADD CONSTRAINT "payroll_advances_employee_id_id_employees_id_fk" FOREIGN KEY ("employee_id_id") REFERENCES "public"."employees"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_advances" ADD CONSTRAINT "payroll_advances_company_u_u_i_d_id_employers_id_fk" FOREIGN KEY ("company_u_u_i_d_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_advances" ADD CONSTRAINT "payroll_advances_created_by_id_users_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_advances" ADD CONSTRAINT "payroll_advances_last_updated_by_id_users_id_fk" FOREIGN KEY ("last_updated_by_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_factoring" ADD CONSTRAINT "payroll_factoring_company_u_u_i_d_id_employers_id_fk" FOREIGN KEY ("company_u_u_i_d_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_repayments" ADD CONSTRAINT "payroll_repayments_advance_id_id_payroll_advances_id_fk" FOREIGN KEY ("advance_id_id") REFERENCES "public"."payroll_advances"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions" ADD CONSTRAINT "payroll_transactions_company_u_u_i_d_id_employers_id_fk" FOREIGN KEY ("company_u_u_i_d_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions" ADD CONSTRAINT "payroll_transactions_employee_id_id_employees_id_fk" FOREIGN KEY ("employee_id_id") REFERENCES "public"."employees"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions" ADD CONSTRAINT "payroll_transactions_advance_id_id_payroll_advances_id_fk" FOREIGN KEY ("advance_id_id") REFERENCES "public"."payroll_advances"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions" ADD CONSTRAINT "payroll_transactions_repayment_id_id_payroll_repayments_id_fk" FOREIGN KEY ("repayment_id_id") REFERENCES "public"."payroll_repayments"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions" ADD CONSTRAINT "payroll_transactions_metadata_initiated_by_id_users_id_fk" FOREIGN KEY ("metadata_initiated_by_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions" ADD CONSTRAINT "payroll_transactions_metadata_approved_by_id_users_id_fk" FOREIGN KEY ("metadata_approved_by_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions_fees" ADD CONSTRAINT "payroll_transactions_fees_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."payroll_transactions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions_metadata_attachments" ADD CONSTRAINT "payroll_transactions_metadata_attachments_file_id_media_id_fk" FOREIGN KEY ("file_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payroll_transactions_metadata_attachments" ADD CONSTRAINT "payroll_transactions_metadata_attachments_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."payroll_transactions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payrolls" ADD CONSTRAINT "payrolls_employer_id_id_employers_id_fk" FOREIGN KEY ("employer_id_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts" ADD CONSTRAINT "posts_hero_image_id_media_id_fk" FOREIGN KEY ("hero_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts" ADD CONSTRAINT "posts_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts_populated_authors" ADD CONSTRAINT "posts_populated_authors_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts_rels" ADD CONSTRAINT "posts_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts_rels" ADD CONSTRAINT "posts_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts_rels" ADD CONSTRAINT "posts_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts_rels" ADD CONSTRAINT "posts_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "redirects_rels" ADD CONSTRAINT "redirects_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."redirects"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "redirects_rels" ADD CONSTRAINT "redirects_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "redirects_rels" ADD CONSTRAINT "redirects_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "search" ADD CONSTRAINT "search_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "search_categories" ADD CONSTRAINT "search_categories_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."search"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "search_rels" ADD CONSTRAINT "search_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."search"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "search_rels" ADD CONSTRAINT "search_rels_posts_fk" FOREIGN KEY ("posts_id") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_employee_profile_id_employees_id_fk" FOREIGN KEY ("employee_profile_id") REFERENCES "public"."employees"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_employer_profile_id_employers_id_fk" FOREIGN KEY ("employer_profile_id") REFERENCES "public"."employers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users_permissions" ADD CONSTRAINT "users_permissions_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "_pages_v_parent_idx" ON "_pages_v" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_version_hero_version_hero_media_idx" ON "_pages_v" USING btree ("version_hero_media_id");--> statement-breakpoint
CREATE INDEX "_pages_v_version_meta_version_meta_image_idx" ON "_pages_v" USING btree ("version_meta_image_id");--> statement-breakpoint
CREATE INDEX "_pages_v_version_version_slug_idx" ON "_pages_v" USING btree ("version_slug");--> statement-breakpoint
CREATE INDEX "_pages_v_version_version_updated_at_idx" ON "_pages_v" USING btree ("version_updated_at");--> statement-breakpoint
CREATE INDEX "_pages_v_version_version_created_at_idx" ON "_pages_v" USING btree ("version_created_at");--> statement-breakpoint
CREATE INDEX "_pages_v_version_version__status_idx" ON "_pages_v" USING btree ("version__status");--> statement-breakpoint
CREATE INDEX "_pages_v_created_at_idx" ON "_pages_v" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "_pages_v_updated_at_idx" ON "_pages_v" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "_pages_v_latest_idx" ON "_pages_v" USING btree ("latest");--> statement-breakpoint
CREATE INDEX "_pages_v_autosave_idx" ON "_pages_v" USING btree ("autosave");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_archive_order_idx" ON "_pages_v_blocks_archive" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_archive_parent_id_idx" ON "_pages_v_blocks_archive" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_archive_path_idx" ON "_pages_v_blocks_archive" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_content_order_idx" ON "_pages_v_blocks_content" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_content_parent_id_idx" ON "_pages_v_blocks_content" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_content_path_idx" ON "_pages_v_blocks_content" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_content_columns_order_idx" ON "_pages_v_blocks_content_columns" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_content_columns_parent_id_idx" ON "_pages_v_blocks_content_columns" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_cta_order_idx" ON "_pages_v_blocks_cta" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_cta_parent_id_idx" ON "_pages_v_blocks_cta" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_cta_path_idx" ON "_pages_v_blocks_cta" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_cta_links_order_idx" ON "_pages_v_blocks_cta_links" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_cta_links_parent_id_idx" ON "_pages_v_blocks_cta_links" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_form_block_order_idx" ON "_pages_v_blocks_form_block" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_form_block_parent_id_idx" ON "_pages_v_blocks_form_block" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_form_block_path_idx" ON "_pages_v_blocks_form_block" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_form_block_form_idx" ON "_pages_v_blocks_form_block" USING btree ("form_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_media_block_order_idx" ON "_pages_v_blocks_media_block" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_media_block_parent_id_idx" ON "_pages_v_blocks_media_block" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_media_block_path_idx" ON "_pages_v_blocks_media_block" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "_pages_v_blocks_media_block_media_idx" ON "_pages_v_blocks_media_block" USING btree ("media_id");--> statement-breakpoint
CREATE INDEX "_pages_v_rels_order_idx" ON "_pages_v_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "_pages_v_rels_parent_idx" ON "_pages_v_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "_pages_v_rels_path_idx" ON "_pages_v_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "_pages_v_rels_pages_id_idx" ON "_pages_v_rels" USING btree ("pages_id");--> statement-breakpoint
CREATE INDEX "_pages_v_rels_posts_id_idx" ON "_pages_v_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "_pages_v_rels_categories_id_idx" ON "_pages_v_rels" USING btree ("categories_id");--> statement-breakpoint
CREATE INDEX "_pages_v_version_hero_links_order_idx" ON "_pages_v_version_hero_links" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_pages_v_version_hero_links_parent_id_idx" ON "_pages_v_version_hero_links" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "_posts_v_parent_idx" ON "_posts_v" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "_posts_v_version_version_hero_image_idx" ON "_posts_v" USING btree ("version_hero_image_id");--> statement-breakpoint
CREATE INDEX "_posts_v_version_meta_version_meta_image_idx" ON "_posts_v" USING btree ("version_meta_image_id");--> statement-breakpoint
CREATE INDEX "_posts_v_version_version_slug_idx" ON "_posts_v" USING btree ("version_slug");--> statement-breakpoint
CREATE INDEX "_posts_v_version_version_updated_at_idx" ON "_posts_v" USING btree ("version_updated_at");--> statement-breakpoint
CREATE INDEX "_posts_v_version_version_created_at_idx" ON "_posts_v" USING btree ("version_created_at");--> statement-breakpoint
CREATE INDEX "_posts_v_version_version__status_idx" ON "_posts_v" USING btree ("version__status");--> statement-breakpoint
CREATE INDEX "_posts_v_created_at_idx" ON "_posts_v" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "_posts_v_updated_at_idx" ON "_posts_v" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "_posts_v_latest_idx" ON "_posts_v" USING btree ("latest");--> statement-breakpoint
CREATE INDEX "_posts_v_autosave_idx" ON "_posts_v" USING btree ("autosave");--> statement-breakpoint
CREATE INDEX "_posts_v_rels_order_idx" ON "_posts_v_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "_posts_v_rels_parent_idx" ON "_posts_v_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "_posts_v_rels_path_idx" ON "_posts_v_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "_posts_v_rels_posts_id_idx" ON "_posts_v_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "_posts_v_rels_categories_id_idx" ON "_posts_v_rels" USING btree ("categories_id");--> statement-breakpoint
CREATE INDEX "_posts_v_rels_users_id_idx" ON "_posts_v_rels" USING btree ("users_id");--> statement-breakpoint
CREATE INDEX "_posts_v_version_populated_authors_order_idx" ON "_posts_v_version_populated_authors" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "_posts_v_version_populated_authors_parent_id_idx" ON "_posts_v_version_populated_authors" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "categories_slug_idx" ON "categories" USING btree ("slug");--> statement-breakpoint
CREATE INDEX "categories_parent_idx" ON "categories" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "categories_updated_at_idx" ON "categories" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "categories_created_at_idx" ON "categories" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "categories_breadcrumbs_order_idx" ON "categories_breadcrumbs" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "categories_breadcrumbs_parent_id_idx" ON "categories_breadcrumbs" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "categories_breadcrumbs_doc_idx" ON "categories_breadcrumbs" USING btree ("doc_id");--> statement-breakpoint
CREATE UNIQUE INDEX "employees_employee_uuid_idx" ON "employees" USING btree ("employee_uuid");--> statement-breakpoint
CREATE INDEX "employees_user_id_idx" ON "employees" USING btree ("user_id_id");--> statement-breakpoint
CREATE INDEX "employees_employer_id_idx" ON "employees" USING btree ("employer_id_id");--> statement-breakpoint
CREATE UNIQUE INDEX "employees_employee_id_idx" ON "employees" USING btree ("employee_id");--> statement-breakpoint
CREATE INDEX "employees_employer_profile_idx" ON "employees" USING btree ("employer_profile_id");--> statement-breakpoint
CREATE INDEX "employees_company_u_u_i_d_idx" ON "employees" USING btree ("company_u_u_i_d_id");--> statement-breakpoint
CREATE INDEX "employees_loan_access_loan_access_approved_by_idx" ON "employees" USING btree ("loan_access_approved_by_id");--> statement-breakpoint
CREATE UNIQUE INDEX "employees_email_idx" ON "employees" USING btree ("email");--> statement-breakpoint
CREATE INDEX "employees_advance_history_order_idx" ON "employees_advance_history" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "employees_advance_history_parent_id_idx" ON "employees_advance_history" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "employees_advance_history_advance_id_idx" ON "employees_advance_history" USING btree ("advance_id_id");--> statement-breakpoint
CREATE INDEX "employees_documents_order_idx" ON "employees_documents" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "employees_documents_parent_id_idx" ON "employees_documents" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "employees_documents_file_idx" ON "employees_documents" USING btree ("file_id");--> statement-breakpoint
CREATE INDEX "employers_avatar_idx" ON "employers" USING btree ("avatar_id");--> statement-breakpoint
CREATE INDEX "employers_user_id_idx" ON "employers" USING btree ("user_id_id");--> statement-breakpoint
CREATE UNIQUE INDEX "employers_company_u_u_i_d_idx" ON "employers" USING btree ("company_u_u_i_d");--> statement-breakpoint
CREATE UNIQUE INDEX "employers_registration_number_idx" ON "employers" USING btree ("registration_number");--> statement-breakpoint
CREATE UNIQUE INDEX "employers_email_idx" ON "employers" USING btree ("email");--> statement-breakpoint
CREATE INDEX "employers_payroll_settings_payroll_dates_order_idx" ON "employers_payroll_settings_payroll_dates" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "employers_payroll_settings_payroll_dates_parent_id_idx" ON "employers_payroll_settings_payroll_dates" USING btree ("_parent_id");--> statement-breakpoint
CREATE UNIQUE INDEX "factoring_calculations_advance_id_idx" ON "factoring_calculations" USING btree ("advance_id");--> statement-breakpoint
CREATE INDEX "factoring_calculations_employer_id_idx" ON "factoring_calculations" USING btree ("employer_id_id");--> statement-breakpoint
CREATE INDEX "factoring_calculations_payroll_id_idx" ON "factoring_calculations" USING btree ("payroll_id_id");--> statement-breakpoint
CREATE INDEX "factoring_calculations_updated_at_idx" ON "factoring_calculations" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "factoring_calculations_created_at_idx" ON "factoring_calculations" USING btree ("created_at");--> statement-breakpoint
CREATE UNIQUE INDEX "factoring_repayments_repayment_id_idx" ON "factoring_repayments" USING btree ("repayment_id");--> statement-breakpoint
CREATE INDEX "factoring_repayments_advance_id_idx" ON "factoring_repayments" USING btree ("advance_id_id");--> statement-breakpoint
CREATE INDEX "factoring_repayments_company_u_u_i_d_idx" ON "factoring_repayments" USING btree ("company_u_u_i_d_id");--> statement-breakpoint
CREATE INDEX "factoring_repayments_late_fees_order_idx" ON "factoring_repayments_late_fees" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "factoring_repayments_late_fees_parent_id_idx" ON "factoring_repayments_late_fees" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "factoring_repayments_payment_history_order_idx" ON "factoring_repayments_payment_history" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "factoring_repayments_payment_history_parent_id_idx" ON "factoring_repayments_payment_history" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "footer_nav_items_order_idx" ON "footer_nav_items" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "footer_nav_items_parent_id_idx" ON "footer_nav_items" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "footer_rels_order_idx" ON "footer_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "footer_rels_parent_idx" ON "footer_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "footer_rels_path_idx" ON "footer_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "footer_rels_pages_id_idx" ON "footer_rels" USING btree ("pages_id");--> statement-breakpoint
CREATE INDEX "footer_rels_posts_id_idx" ON "footer_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "form_submissions_form_idx" ON "form_submissions" USING btree ("form_id");--> statement-breakpoint
CREATE INDEX "form_submissions_updated_at_idx" ON "form_submissions" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "form_submissions_created_at_idx" ON "form_submissions" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "form_submissions_submission_data_order_idx" ON "form_submissions_submission_data" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "form_submissions_submission_data_parent_id_idx" ON "form_submissions_submission_data" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_updated_at_idx" ON "forms" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "forms_created_at_idx" ON "forms" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "forms_blocks_checkbox_order_idx" ON "forms_blocks_checkbox" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_checkbox_parent_id_idx" ON "forms_blocks_checkbox" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_checkbox_path_idx" ON "forms_blocks_checkbox" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_country_order_idx" ON "forms_blocks_country" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_country_parent_id_idx" ON "forms_blocks_country" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_country_path_idx" ON "forms_blocks_country" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_email_order_idx" ON "forms_blocks_email" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_email_parent_id_idx" ON "forms_blocks_email" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_email_path_idx" ON "forms_blocks_email" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_message_order_idx" ON "forms_blocks_message" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_message_parent_id_idx" ON "forms_blocks_message" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_message_path_idx" ON "forms_blocks_message" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_number_order_idx" ON "forms_blocks_number" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_number_parent_id_idx" ON "forms_blocks_number" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_number_path_idx" ON "forms_blocks_number" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_select_order_idx" ON "forms_blocks_select" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_select_parent_id_idx" ON "forms_blocks_select" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_select_path_idx" ON "forms_blocks_select" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_select_options_order_idx" ON "forms_blocks_select_options" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_select_options_parent_id_idx" ON "forms_blocks_select_options" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_state_order_idx" ON "forms_blocks_state" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_state_parent_id_idx" ON "forms_blocks_state" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_state_path_idx" ON "forms_blocks_state" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_text_order_idx" ON "forms_blocks_text" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_text_parent_id_idx" ON "forms_blocks_text" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_text_path_idx" ON "forms_blocks_text" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_blocks_textarea_order_idx" ON "forms_blocks_textarea" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_blocks_textarea_parent_id_idx" ON "forms_blocks_textarea" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "forms_blocks_textarea_path_idx" ON "forms_blocks_textarea" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "forms_emails_order_idx" ON "forms_emails" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "forms_emails_parent_id_idx" ON "forms_emails" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "header_nav_items_order_idx" ON "header_nav_items" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "header_nav_items_parent_id_idx" ON "header_nav_items" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "header_rels_order_idx" ON "header_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "header_rels_parent_idx" ON "header_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "header_rels_path_idx" ON "header_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "header_rels_pages_id_idx" ON "header_rels" USING btree ("pages_id");--> statement-breakpoint
CREATE INDEX "header_rels_posts_id_idx" ON "header_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "media_updated_at_idx" ON "media" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "media_created_at_idx" ON "media" USING btree ("created_at");--> statement-breakpoint
CREATE UNIQUE INDEX "media_filename_idx" ON "media" USING btree ("filename");--> statement-breakpoint
CREATE INDEX "media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "media" USING btree ("sizes_thumbnail_filename");--> statement-breakpoint
CREATE INDEX "media_sizes_square_sizes_square_filename_idx" ON "media" USING btree ("sizes_square_filename");--> statement-breakpoint
CREATE INDEX "media_sizes_small_sizes_small_filename_idx" ON "media" USING btree ("sizes_small_filename");--> statement-breakpoint
CREATE INDEX "media_sizes_medium_sizes_medium_filename_idx" ON "media" USING btree ("sizes_medium_filename");--> statement-breakpoint
CREATE INDEX "media_sizes_large_sizes_large_filename_idx" ON "media" USING btree ("sizes_large_filename");--> statement-breakpoint
CREATE INDEX "media_sizes_xlarge_sizes_xlarge_filename_idx" ON "media" USING btree ("sizes_xlarge_filename");--> statement-breakpoint
CREATE INDEX "media_sizes_og_sizes_og_filename_idx" ON "media" USING btree ("sizes_og_filename");--> statement-breakpoint
CREATE INDEX "pages_hero_hero_media_idx" ON "pages" USING btree ("hero_media_id");--> statement-breakpoint
CREATE INDEX "pages_meta_meta_image_idx" ON "pages" USING btree ("meta_image_id");--> statement-breakpoint
CREATE INDEX "pages_slug_idx" ON "pages" USING btree ("slug");--> statement-breakpoint
CREATE INDEX "pages_updated_at_idx" ON "pages" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "pages_created_at_idx" ON "pages" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "pages__status_idx" ON "pages" USING btree ("_status");--> statement-breakpoint
CREATE INDEX "pages_blocks_archive_order_idx" ON "pages_blocks_archive" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_archive_parent_id_idx" ON "pages_blocks_archive" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_archive_path_idx" ON "pages_blocks_archive" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "pages_blocks_content_order_idx" ON "pages_blocks_content" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_content_parent_id_idx" ON "pages_blocks_content" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_content_path_idx" ON "pages_blocks_content" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "pages_blocks_content_columns_order_idx" ON "pages_blocks_content_columns" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_content_columns_parent_id_idx" ON "pages_blocks_content_columns" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_cta_order_idx" ON "pages_blocks_cta" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_cta_parent_id_idx" ON "pages_blocks_cta" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_cta_path_idx" ON "pages_blocks_cta" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "pages_blocks_cta_links_order_idx" ON "pages_blocks_cta_links" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_cta_links_parent_id_idx" ON "pages_blocks_cta_links" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_form_block_order_idx" ON "pages_blocks_form_block" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_form_block_parent_id_idx" ON "pages_blocks_form_block" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_form_block_path_idx" ON "pages_blocks_form_block" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "pages_blocks_form_block_form_idx" ON "pages_blocks_form_block" USING btree ("form_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_media_block_order_idx" ON "pages_blocks_media_block" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_blocks_media_block_parent_id_idx" ON "pages_blocks_media_block" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_blocks_media_block_path_idx" ON "pages_blocks_media_block" USING btree ("_path");--> statement-breakpoint
CREATE INDEX "pages_blocks_media_block_media_idx" ON "pages_blocks_media_block" USING btree ("media_id");--> statement-breakpoint
CREATE INDEX "pages_hero_links_order_idx" ON "pages_hero_links" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "pages_hero_links_parent_id_idx" ON "pages_hero_links" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "pages_rels_order_idx" ON "pages_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "pages_rels_parent_idx" ON "pages_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "pages_rels_path_idx" ON "pages_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "pages_rels_pages_id_idx" ON "pages_rels" USING btree ("pages_id");--> statement-breakpoint
CREATE INDEX "pages_rels_posts_id_idx" ON "pages_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "pages_rels_categories_id_idx" ON "pages_rels" USING btree ("categories_id");--> statement-breakpoint
CREATE INDEX "payload_jobs_completed_at_idx" ON "payload_jobs" USING btree ("completed_at");--> statement-breakpoint
CREATE INDEX "payload_jobs_total_tried_idx" ON "payload_jobs" USING btree ("total_tried");--> statement-breakpoint
CREATE INDEX "payload_jobs_has_error_idx" ON "payload_jobs" USING btree ("has_error");--> statement-breakpoint
CREATE INDEX "payload_jobs_task_slug_idx" ON "payload_jobs" USING btree ("task_slug");--> statement-breakpoint
CREATE INDEX "payload_jobs_queue_idx" ON "payload_jobs" USING btree ("queue");--> statement-breakpoint
CREATE INDEX "payload_jobs_wait_until_idx" ON "payload_jobs" USING btree ("wait_until");--> statement-breakpoint
CREATE INDEX "payload_jobs_processing_idx" ON "payload_jobs" USING btree ("processing");--> statement-breakpoint
CREATE INDEX "payload_jobs_updated_at_idx" ON "payload_jobs" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payload_jobs_created_at_idx" ON "payload_jobs" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "payload_jobs_log_order_idx" ON "payload_jobs_log" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "payload_jobs_log_parent_id_idx" ON "payload_jobs_log" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_global_slug_idx" ON "payload_locked_documents" USING btree ("global_slug");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_updated_at_idx" ON "payload_locked_documents" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_created_at_idx" ON "payload_locked_documents" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_order_idx" ON "payload_locked_documents_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_parent_idx" ON "payload_locked_documents_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_path_idx" ON "payload_locked_documents_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_pages_id_idx" ON "payload_locked_documents_rels" USING btree ("pages_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_posts_id_idx" ON "payload_locked_documents_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_media_id_idx" ON "payload_locked_documents_rels" USING btree ("media_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_categories_id_idx" ON "payload_locked_documents_rels" USING btree ("categories_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_users_id_idx" ON "payload_locked_documents_rels" USING btree ("users_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_employers_id_idx" ON "payload_locked_documents_rels" USING btree ("employers_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_employees_id_idx" ON "payload_locked_documents_rels" USING btree ("employees_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_payroll_advances_id_idx" ON "payload_locked_documents_rels" USING btree ("payroll_advances_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_payroll_repayments_id_idx" ON "payload_locked_documents_rels" USING btree ("payroll_repayments_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_payrolls_id_idx" ON "payload_locked_documents_rels" USING btree ("payrolls_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_payroll_transactions_id_idx" ON "payload_locked_documents_rels" USING btree ("payroll_transactions_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_factoring_calculations_id_idx" ON "payload_locked_documents_rels" USING btree ("factoring_calculations_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_factoring_repayments_id_idx" ON "payload_locked_documents_rels" USING btree ("factoring_repayments_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_payroll_factoring_id_idx" ON "payload_locked_documents_rels" USING btree ("payroll_factoring_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_redirects_id_idx" ON "payload_locked_documents_rels" USING btree ("redirects_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_forms_id_idx" ON "payload_locked_documents_rels" USING btree ("forms_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_form_submissions_id_idx" ON "payload_locked_documents_rels" USING btree ("form_submissions_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_search_id_idx" ON "payload_locked_documents_rels" USING btree ("search_id");--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_payload_jobs_id_idx" ON "payload_locked_documents_rels" USING btree ("payload_jobs_id");--> statement-breakpoint
CREATE INDEX "payload_migrations_updated_at_idx" ON "payload_migrations" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payload_migrations_created_at_idx" ON "payload_migrations" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "payload_preferences_key_idx" ON "payload_preferences" USING btree ("key");--> statement-breakpoint
CREATE INDEX "payload_preferences_updated_at_idx" ON "payload_preferences" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payload_preferences_created_at_idx" ON "payload_preferences" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_order_idx" ON "payload_preferences_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_parent_idx" ON "payload_preferences_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_path_idx" ON "payload_preferences_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_users_id_idx" ON "payload_preferences_rels" USING btree ("users_id");--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_employers_id_idx" ON "payload_preferences_rels" USING btree ("employers_id");--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_employees_id_idx" ON "payload_preferences_rels" USING btree ("employees_id");--> statement-breakpoint
CREATE UNIQUE INDEX "payroll_advances_advance_id_idx" ON "payroll_advances" USING btree ("advance_id");--> statement-breakpoint
CREATE INDEX "payroll_advances_employee_id_idx" ON "payroll_advances" USING btree ("employee_id_id");--> statement-breakpoint
CREATE INDEX "payroll_advances_company_u_u_i_d_idx" ON "payroll_advances" USING btree ("company_u_u_i_d_id");--> statement-breakpoint
CREATE INDEX "payroll_advances_created_by_idx" ON "payroll_advances" USING btree ("created_by_id");--> statement-breakpoint
CREATE INDEX "payroll_advances_last_updated_by_idx" ON "payroll_advances" USING btree ("last_updated_by_id");--> statement-breakpoint
CREATE INDEX "payroll_advances_updated_at_idx" ON "payroll_advances" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payroll_advances_created_at_idx" ON "payroll_advances" USING btree ("created_at");--> statement-breakpoint
CREATE UNIQUE INDEX "payroll_factoring_factor_u_u_i_d_idx" ON "payroll_factoring" USING btree ("factor_u_u_i_d");--> statement-breakpoint
CREATE INDEX "payroll_factoring_company_u_u_i_d_idx" ON "payroll_factoring" USING btree ("company_u_u_i_d_id");--> statement-breakpoint
CREATE INDEX "payroll_factoring_updated_at_idx" ON "payroll_factoring" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payroll_factoring_created_at_idx" ON "payroll_factoring" USING btree ("created_at");--> statement-breakpoint
CREATE UNIQUE INDEX "payroll_repayments_repayment_id_idx" ON "payroll_repayments" USING btree ("repayment_id");--> statement-breakpoint
CREATE INDEX "payroll_repayments_advance_id_idx" ON "payroll_repayments" USING btree ("advance_id_id");--> statement-breakpoint
CREATE INDEX "payroll_repayments_updated_at_idx" ON "payroll_repayments" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payroll_repayments_created_at_idx" ON "payroll_repayments" USING btree ("created_at");--> statement-breakpoint
CREATE UNIQUE INDEX "payroll_transactions_transaction_id_idx" ON "payroll_transactions" USING btree ("transaction_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_company_u_u_i_d_idx" ON "payroll_transactions" USING btree ("company_u_u_i_d_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_employee_id_idx" ON "payroll_transactions" USING btree ("employee_id_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_advance_id_idx" ON "payroll_transactions" USING btree ("advance_id_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_repayment_id_idx" ON "payroll_transactions" USING btree ("repayment_id_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_metadata_metadata_initiated_by_idx" ON "payroll_transactions" USING btree ("metadata_initiated_by_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_metadata_metadata_approved_by_idx" ON "payroll_transactions" USING btree ("metadata_approved_by_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_fees_order_idx" ON "payroll_transactions_fees" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "payroll_transactions_fees_parent_id_idx" ON "payroll_transactions_fees" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_metadata_attachments_order_idx" ON "payroll_transactions_metadata_attachments" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "payroll_transactions_metadata_attachments_parent_id_idx" ON "payroll_transactions_metadata_attachments" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "payroll_transactions_metadata_attachments_file_idx" ON "payroll_transactions_metadata_attachments" USING btree ("file_id");--> statement-breakpoint
CREATE UNIQUE INDEX "payrolls_payroll_id_idx" ON "payrolls" USING btree ("payroll_id");--> statement-breakpoint
CREATE INDEX "payrolls_employer_id_idx" ON "payrolls" USING btree ("employer_id_id");--> statement-breakpoint
CREATE INDEX "payrolls_updated_at_idx" ON "payrolls" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "payrolls_created_at_idx" ON "payrolls" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "posts_hero_image_idx" ON "posts" USING btree ("hero_image_id");--> statement-breakpoint
CREATE INDEX "posts_meta_meta_image_idx" ON "posts" USING btree ("meta_image_id");--> statement-breakpoint
CREATE INDEX "posts_slug_idx" ON "posts" USING btree ("slug");--> statement-breakpoint
CREATE INDEX "posts_updated_at_idx" ON "posts" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "posts_created_at_idx" ON "posts" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "posts__status_idx" ON "posts" USING btree ("_status");--> statement-breakpoint
CREATE INDEX "posts_populated_authors_order_idx" ON "posts_populated_authors" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "posts_populated_authors_parent_id_idx" ON "posts_populated_authors" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "posts_rels_order_idx" ON "posts_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "posts_rels_parent_idx" ON "posts_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "posts_rels_path_idx" ON "posts_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "posts_rels_posts_id_idx" ON "posts_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "posts_rels_categories_id_idx" ON "posts_rels" USING btree ("categories_id");--> statement-breakpoint
CREATE INDEX "posts_rels_users_id_idx" ON "posts_rels" USING btree ("users_id");--> statement-breakpoint
CREATE INDEX "redirects_from_idx" ON "redirects" USING btree ("from");--> statement-breakpoint
CREATE INDEX "redirects_updated_at_idx" ON "redirects" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "redirects_created_at_idx" ON "redirects" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "redirects_rels_order_idx" ON "redirects_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "redirects_rels_parent_idx" ON "redirects_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "redirects_rels_path_idx" ON "redirects_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "redirects_rels_pages_id_idx" ON "redirects_rels" USING btree ("pages_id");--> statement-breakpoint
CREATE INDEX "redirects_rels_posts_id_idx" ON "redirects_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE INDEX "search_slug_idx" ON "search" USING btree ("slug");--> statement-breakpoint
CREATE INDEX "search_meta_meta_image_idx" ON "search" USING btree ("meta_image_id");--> statement-breakpoint
CREATE INDEX "search_updated_at_idx" ON "search" USING btree ("updated_at");--> statement-breakpoint
CREATE INDEX "search_created_at_idx" ON "search" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "search_categories_order_idx" ON "search_categories" USING btree ("_order");--> statement-breakpoint
CREATE INDEX "search_categories_parent_id_idx" ON "search_categories" USING btree ("_parent_id");--> statement-breakpoint
CREATE INDEX "search_rels_order_idx" ON "search_rels" USING btree ("order");--> statement-breakpoint
CREATE INDEX "search_rels_parent_idx" ON "search_rels" USING btree ("parent_id");--> statement-breakpoint
CREATE INDEX "search_rels_path_idx" ON "search_rels" USING btree ("path");--> statement-breakpoint
CREATE INDEX "search_rels_posts_id_idx" ON "search_rels" USING btree ("posts_id");--> statement-breakpoint
CREATE UNIQUE INDEX "users_user_id_idx" ON "users" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "users_employee_profile_idx" ON "users" USING btree ("employee_profile_id");--> statement-breakpoint
CREATE INDEX "users_employer_profile_idx" ON "users" USING btree ("employer_profile_id");--> statement-breakpoint
CREATE UNIQUE INDEX "users_email_idx" ON "users" USING btree ("email");--> statement-breakpoint
CREATE INDEX "users_permissions_order_idx" ON "users_permissions" USING btree ("order");--> statement-breakpoint
CREATE INDEX "users_permissions_parent_idx" ON "users_permissions" USING btree ("parent_id");