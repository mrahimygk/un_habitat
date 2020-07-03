CREATE TABLE "role" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "name" varchar(50)
);

CREATE TABLE "role_localized" (
  "id" SERIAL PRIMARY KEY,
  "role_id" int,
  "locale" varchar(10),
  "name" varchar(50)
);

CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "f_name" varchar(50) NOT NULL,
  "l_name" varchar(50) NOT NULL,
  "phone_number" varchar(11) UNIQUE NOT NULL,
  "email" varchar(50),
  "username" varchar(50) UNIQUE NOT NULL,
  "password" varchar(255) NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "last_login" timestamp
);

CREATE TABLE "user_join_role" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "role_id" int,
  "assigned_by" int,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "agent_visit_task_country_subdivision" (
  "id" SERIAL PRIMARY KEY,
  "agent_id" int,
  "country_subdivision_id" int,
  "assigned_date" timestamp
);

CREATE TABLE "agent_visit_task_building" (
  "id" SERIAL PRIMARY KEY,
  "agent_id" int,
  "building_id" int,
  "assigned_date" timestamp
);

CREATE TABLE "country_subdivision_type" (
  "id" SERIAL PRIMARY KEY,
  "parent_id" int,
  "type_name" varchar(50),
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "country_subdivision_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "locale" varchar(10),
  "type_name" varchar(50)
);

CREATE TABLE "country_subdivision" (
  "id" SERIAL PRIMARY KEY,
  "subdivision_name" varchar(50),
  "amar_village_code" int,
  "household_count" int,
  "population_count" int,
  "females_count" int,
  "males_count" int,
  "building_unit_count" int,
  "is_residency_permanent" boolean,
  "roof_type_id" int,
  "cathedra_type_id" int,
  "is_one_story" boolean,
  "foudation_construction_material_id" int,
  "walls_construction_material_id" int,
  "roof_construction_material_id" int,
  "window_construction_material_id" int,
  "unique_code" int,
  "type" int,
  "parent_id" int,
  "area" polygon NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "controlled_by_admin" int
);

CREATE TABLE "roof_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "roof_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "roof_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "cathedra_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "cathedra_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "cathedra_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_incident_history" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "agent_id" int,
  "description" text
);

CREATE TABLE "village_location_danger" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "location_danger_id" int,
  "description" text
);

CREATE TABLE "location_danger" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "location_danger_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "location_danger_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_damage" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "persian_date_picked" varchar(15),
  "agent_id" int,
  "damage_percent" numeric,
  "description" text
);

CREATE TABLE "village_departure" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "departure_type_id" int
);

CREATE TABLE "departure_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "departure_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "departure_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_incident_action" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "incident_action_id" int
);

CREATE TABLE "incident_action" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "incident_action_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "incident_action_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_danger" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_danger_id" int,
  "country_subdivision_id" int
);

CREATE TABLE "country_subdivision_danger" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "country_subdivision_danger_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "country_subdivision_danger_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_livelihood" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "livelihood_id" int
);

CREATE TABLE "livelihood" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "livelihood_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "livelihood_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_access_route" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "type_id" int
);

CREATE TABLE "road_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "road_access" (
  "id" SERIAL PRIMARY KEY,
  "village_access_route_id" int,
  "other_road_type" int,
  "length_to_other_road" int
);

CREATE TABLE "village_education" (
  "country_subdivision_id" int,
  "educational_subdivision_id" int,
  "count" int
);

CREATE TABLE "educational_subdivision" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "educational_subdivision_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "educational_subdivision_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_sanitation" (
  "country_subdivision_id" int,
  "sanitation_id" int,
  "count" int
);

CREATE TABLE "sanitation" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "sanitation_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "sanitation_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_business_area" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "count" int,
  "is_high_importance" boolean
);

CREATE TABLE "facility" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "facility_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "facility_id" int,
  "name" varchar(50)
);

CREATE TABLE "village_facility" (
  "id" SERIAL PRIMARY KEY,
  "subscribtion_id" int,
  "facility_id" int
);

CREATE TABLE "country_subdivision_localized" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "locale" varchar(10),
  "subdivision_name" varchar(50)
);

CREATE TABLE "area_size_unit" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "area_size_unit_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "area_size_unit_id" int,
  "name" varchar(50)
);

CREATE TABLE "building" (
  "id" SERIAL PRIMARY KEY,
  "code" varchar(50),
  "lat" numeric,
  "lng" numeric,
  "address" text,
  "area_size" numeric,
  "area_size_unit" int,
  "utm_x" numeric,
  "utm_y" numeric,
  "utm_zone" numeric,
  "foundation_type_id" int,
  "creator_id" int NOT NULL,
  "country_subdivision_id" int NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "foundation_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "foundation_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "foundation_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "property_unit" (
  "id" SERIAL PRIMARY KEY,
  "floor" int,
  "unit_number" varchar(50),
  "area_size" numeric,
  "area_size_unit" int,
  "postal_code" int,
  "building_id" int
);

CREATE TABLE "unit_residency_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "unit_residency_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "unit_residency_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "construction_material" (
  "id" SERIAL PRIMARY KEY
);

CREATE TABLE "construction_material_localized" (
  "id" SERIAL PRIMARY KEY,
  "material_id" int,
  "locale" varchar(10),
  "name" varchar(50)
);

CREATE TABLE "building_construction" (
  "id" SERIAL PRIMARY KEY,
  "building_id" int,
  "construction_material_id" int
);

CREATE TABLE "building_visit" (
  "id" SERIAL PRIMARY KEY,
  "building_id" int,
  "incident_id" int,
  "stage_number" numeric,
  "is_wall_damaged" boolean,
  "referrence_code" varchar(50),
  "has_objected" int,
  "agent_id" int NOT NULL,
  "visit_date" varchar(15),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "subscribtion" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "subscribtion_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "subscribtion_id" int,
  "name" varchar(50)
);

CREATE TABLE "building_subscribtion" (
  "id" SERIAL PRIMARY KEY,
  "subscribtion_id" int,
  "building_id" int,
  "counter_number" int
);

CREATE TABLE "property_unit_subscribtion" (
  "id" SERIAL PRIMARY KEY,
  "subscribtion_id" int,
  "property_unit_id" int,
  "counter_number" int
);

CREATE TABLE "property_unit_visit" (
  "id" SERIAL PRIMARY KEY,
  "property_unit_id" int,
  "water_level" numeric,
  "incident_id" int,
  "is_wall_damaged" boolean,
  "stage_number" int,
  "referrence_code" varchar(50),
  "has_objected" int,
  "agent_id" int NOT NULL,
  "visit_date" varchar(15),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "person" (
  "id" SERIAL PRIMARY KEY,
  "f_name" varchar(50),
  "l_name" varchar(50),
  "national_code" varchar(12),
  "phone_number" varchar(14),
  "birth_date" varchar(11),
  "father_name" varchar(50),
  "birth_place" varchar(50),
  "is_married" boolean
);

CREATE TABLE "person_wife" (
  "id" SERIAL PRIMARY KEY,
  "person_id" int,
  "f_name" varchar(50),
  "l_name" varchar(50),
  "national_code" varchar(12),
  "birth_date" varchar(11),
  "father_name" varchar(50),
  "birth_place" varchar(50)
);

CREATE TABLE "charitable_organization" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "charitable_organization_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "charitable_organization_id" int,
  "name" varchar(50)
);

CREATE TABLE "charity_advocacy" (
  "id" SERIAL PRIMARY KEY,
  "person_id" int,
  "charitable_organization_id" int
);

CREATE TABLE "ownership_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "ownership_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "ownership_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "building_ownership" (
  "id" SERIAL PRIMARY KEY,
  "owner_id" int,
  "building_id" int,
  "share_percentage" numeric,
  "share_percentage_type_id" int,
  "ownership_type_id" int
);

CREATE TABLE "property_unit_ownership" (
  "id" SERIAL PRIMARY KEY,
  "owner_id" int,
  "unit_id" int,
  "share_percentage" numeric,
  "share_percentage_type_id" int,
  "ownership_type_id" int
);

CREATE TABLE "share_percentage_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "share_percentage_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "share_percentage_type_id" int,
  "locale" varchar(10),
  "name" varchar(50)
);

CREATE TABLE "residency" (
  "id" SERIAL PRIMARY KEY,
  "property_unit_id" int,
  "resident_id" int,
  "is_main" boolean
);

CREATE TABLE "settlement_danger" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "settlement_danger_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "settlement_danger_id" int,
  "name" varchar(50)
);

CREATE TABLE "building_settlement_danger" (
  "id" SERIAL PRIMARY KEY,
  "settlement_danger_id" int,
  "building_id" int
);

CREATE TABLE "damage_reason" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "damage_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "damage_reason_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "damage_reason_id" int,
  "name" varchar(50)
);

CREATE TABLE "damage_type_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "damage_type_id" int,
  "name" varchar(50)
);

CREATE TABLE "building_damage_reason" (
  "id" SERIAL PRIMARY KEY,
  "building_id" int,
  "damage_reason_id" int
);

CREATE TABLE "property_unit_damage_reason" (
  "id" SERIAL PRIMARY KEY,
  "property_unit_id" int,
  "damage_reason_id" int
);

CREATE TABLE "insurance_company" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "insurance_company_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(50),
  "insurance_company_id" int,
  "name" varchar(50)
);

CREATE TABLE "casualty_insurance" (
  "id" SERIAL PRIMARY KEY,
  "insurance_company_id" int,
  "insurance_description" varchar(100),
  "insurance_rate" int
);

CREATE TABLE "building_insurance" (
  "id" SERIAL PRIMARY KEY,
  "building_id" int,
  "insurance_id" int
);

CREATE TABLE "proprty_unit_insurance" (
  "id" SERIAL PRIMARY KEY,
  "property_unit_id" int,
  "insurance_id" int
);

CREATE TABLE "country_subdivision_visit" (
  "id" SERIAL PRIMARY KEY,
  "country_subdivision_id" int,
  "incident_id" int,
  "stage_number" int,
  "referrence_code" varchar(50),
  "has_objected" int,
  "agent_id" int NOT NULL,
  "visit_date" varchar(15),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "incident" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "incident_date" timestamp
);

CREATE TABLE "incident_localized" (
  "id" SERIAL PRIMARY KEY,
  "locale" varchar(10),
  "incident_id" int,
  "name" varchar(50)
);

CREATE TABLE "building_image" (
  "id" SERIAL PRIMARY KEY,
  "building_id" int,
  "picture_path" text
);

CREATE TABLE "property_unit_image" (
  "id" SERIAL PRIMARY KEY,
  "property_unit_id" int,
  "picture_path" text
);

CREATE TABLE "user_login_history" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "login_datetime" timestamp
);

ALTER TABLE "role_localized" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "user_join_role" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_join_role" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "user_join_role" ADD FOREIGN KEY ("assigned_by") REFERENCES "user" ("id");

ALTER TABLE "agent_visit_task_country_subdivision" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "agent_visit_task_country_subdivision" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "agent_visit_task_building" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "agent_visit_task_building" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "country_subdivision_type" ADD FOREIGN KEY ("parent_id") REFERENCES "country_subdivision_type" ("id");

ALTER TABLE "country_subdivision_type_localized" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision_type" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("roof_type_id") REFERENCES "roof_type" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("foudation_construction_material_id") REFERENCES "construction_material" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("walls_construction_material_id") REFERENCES "construction_material" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("roof_construction_material_id") REFERENCES "construction_material" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("window_construction_material_id") REFERENCES "construction_material" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("type") REFERENCES "country_subdivision_type" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("parent_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "country_subdivision" ADD FOREIGN KEY ("controlled_by_admin") REFERENCES "user" ("id");

ALTER TABLE "roof_type_localized" ADD FOREIGN KEY ("roof_type_id") REFERENCES "roof_type" ("id");

ALTER TABLE "cathedra_type_localized" ADD FOREIGN KEY ("cathedra_type_id") REFERENCES "cathedra_type" ("id");

ALTER TABLE "village_incident_history" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_incident_history" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "village_location_danger" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_location_danger" ADD FOREIGN KEY ("location_danger_id") REFERENCES "location_danger" ("id");

ALTER TABLE "location_danger_localized" ADD FOREIGN KEY ("location_danger_id") REFERENCES "location_danger" ("id");

ALTER TABLE "village_damage" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_damage" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "village_departure" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_departure" ADD FOREIGN KEY ("departure_type_id") REFERENCES "departure_type" ("id");

ALTER TABLE "departure_type_localized" ADD FOREIGN KEY ("departure_type_id") REFERENCES "departure_type" ("id");

ALTER TABLE "village_incident_action" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_incident_action" ADD FOREIGN KEY ("incident_action_id") REFERENCES "incident_action" ("id");

ALTER TABLE "incident_action_localized" ADD FOREIGN KEY ("incident_action_id") REFERENCES "incident_action" ("id");

ALTER TABLE "village_danger" ADD FOREIGN KEY ("country_subdivision_danger_id") REFERENCES "country_subdivision_danger" ("id");

ALTER TABLE "village_danger" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "country_subdivision_danger_localized" ADD FOREIGN KEY ("country_subdivision_danger_id") REFERENCES "country_subdivision_danger" ("id");

ALTER TABLE "village_livelihood" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_livelihood" ADD FOREIGN KEY ("livelihood_id") REFERENCES "livelihood" ("id");

ALTER TABLE "livelihood_localized" ADD FOREIGN KEY ("livelihood_id") REFERENCES "livelihood" ("id");

ALTER TABLE "village_access_route" ADD FOREIGN KEY ("type_id") REFERENCES "road_type" ("id");

ALTER TABLE "road_access" ADD FOREIGN KEY ("village_access_route_id") REFERENCES "village_access_route" ("id");

ALTER TABLE "road_access" ADD FOREIGN KEY ("other_road_type") REFERENCES "road_type" ("id");

ALTER TABLE "village_education" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_education" ADD FOREIGN KEY ("educational_subdivision_id") REFERENCES "educational_subdivision" ("id");

ALTER TABLE "educational_subdivision_localized" ADD FOREIGN KEY ("educational_subdivision_id") REFERENCES "educational_subdivision" ("id");

ALTER TABLE "village_sanitation" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "village_sanitation" ADD FOREIGN KEY ("sanitation_id") REFERENCES "sanitation" ("id");

ALTER TABLE "sanitation_localized" ADD FOREIGN KEY ("sanitation_id") REFERENCES "sanitation" ("id");

ALTER TABLE "village_business_area" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "facility_localized" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id");

ALTER TABLE "village_facility" ADD FOREIGN KEY ("subscribtion_id") REFERENCES "subscribtion" ("id");

ALTER TABLE "village_facility" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id");

ALTER TABLE "country_subdivision_localized" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision_type" ("id");

ALTER TABLE "area_size_unit_localized" ADD FOREIGN KEY ("area_size_unit_id") REFERENCES "area_size_unit" ("id");

ALTER TABLE "building" ADD FOREIGN KEY ("area_size_unit") REFERENCES "area_size_unit" ("id");

ALTER TABLE "building" ADD FOREIGN KEY ("foundation_type_id") REFERENCES "foundation_type" ("id");

ALTER TABLE "building" ADD FOREIGN KEY ("creator_id") REFERENCES "user" ("id");

ALTER TABLE "building" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "foundation_type_localized" ADD FOREIGN KEY ("foundation_type_id") REFERENCES "foundation_type" ("id");

ALTER TABLE "property_unit" ADD FOREIGN KEY ("area_size_unit") REFERENCES "area_size_unit" ("id");

ALTER TABLE "property_unit" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "unit_residency_type_localized" ADD FOREIGN KEY ("unit_residency_type_id") REFERENCES "unit_residency_type" ("id");

ALTER TABLE "construction_material_localized" ADD FOREIGN KEY ("material_id") REFERENCES "construction_material" ("id");

ALTER TABLE "building_construction" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "building_construction" ADD FOREIGN KEY ("construction_material_id") REFERENCES "construction_material" ("id");

ALTER TABLE "building_visit" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "building_visit" ADD FOREIGN KEY ("incident_id") REFERENCES "incident" ("id");

ALTER TABLE "building_visit" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "subscribtion_localized" ADD FOREIGN KEY ("subscribtion_id") REFERENCES "subscribtion" ("id");

ALTER TABLE "building_subscribtion" ADD FOREIGN KEY ("subscribtion_id") REFERENCES "subscribtion" ("id");

ALTER TABLE "building_subscribtion" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "property_unit_subscribtion" ADD FOREIGN KEY ("subscribtion_id") REFERENCES "subscribtion" ("id");

ALTER TABLE "property_unit_subscribtion" ADD FOREIGN KEY ("property_unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "property_unit_visit" ADD FOREIGN KEY ("property_unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "property_unit_visit" ADD FOREIGN KEY ("incident_id") REFERENCES "incident" ("id");

ALTER TABLE "property_unit_visit" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "person_wife" ADD FOREIGN KEY ("person_id") REFERENCES "person" ("id");

ALTER TABLE "charitable_organization_localized" ADD FOREIGN KEY ("charitable_organization_id") REFERENCES "charitable_organization" ("id");

ALTER TABLE "charity_advocacy" ADD FOREIGN KEY ("person_id") REFERENCES "person" ("id");

ALTER TABLE "charity_advocacy" ADD FOREIGN KEY ("charitable_organization_id") REFERENCES "charitable_organization" ("id");

ALTER TABLE "ownership_type_localized" ADD FOREIGN KEY ("ownership_type_id") REFERENCES "ownership_type" ("id");

ALTER TABLE "building_ownership" ADD FOREIGN KEY ("owner_id") REFERENCES "person" ("id");

ALTER TABLE "building_ownership" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "building_ownership" ADD FOREIGN KEY ("share_percentage_type_id") REFERENCES "share_percentage_type" ("id");

ALTER TABLE "building_ownership" ADD FOREIGN KEY ("ownership_type_id") REFERENCES "ownership_type" ("id");

ALTER TABLE "property_unit_ownership" ADD FOREIGN KEY ("owner_id") REFERENCES "person" ("id");

ALTER TABLE "property_unit_ownership" ADD FOREIGN KEY ("unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "property_unit_ownership" ADD FOREIGN KEY ("share_percentage_type_id") REFERENCES "share_percentage_type" ("id");

ALTER TABLE "property_unit_ownership" ADD FOREIGN KEY ("ownership_type_id") REFERENCES "ownership_type" ("id");

ALTER TABLE "share_percentage_type_localized" ADD FOREIGN KEY ("share_percentage_type_id") REFERENCES "share_percentage_type" ("id");

ALTER TABLE "residency" ADD FOREIGN KEY ("property_unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "residency" ADD FOREIGN KEY ("resident_id") REFERENCES "person" ("id");

ALTER TABLE "settlement_danger_localized" ADD FOREIGN KEY ("settlement_danger_id") REFERENCES "settlement_danger" ("id");

ALTER TABLE "building_settlement_danger" ADD FOREIGN KEY ("settlement_danger_id") REFERENCES "settlement_danger" ("id");

ALTER TABLE "building_settlement_danger" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "damage_reason_localized" ADD FOREIGN KEY ("damage_reason_id") REFERENCES "damage_reason" ("id");

ALTER TABLE "damage_type_localized" ADD FOREIGN KEY ("damage_type_id") REFERENCES "damage_type" ("id");

ALTER TABLE "building_damage_reason" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "building_damage_reason" ADD FOREIGN KEY ("damage_reason_id") REFERENCES "damage_reason" ("id");

ALTER TABLE "property_unit_damage_reason" ADD FOREIGN KEY ("property_unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "property_unit_damage_reason" ADD FOREIGN KEY ("damage_reason_id") REFERENCES "damage_reason" ("id");

ALTER TABLE "insurance_company_localized" ADD FOREIGN KEY ("insurance_company_id") REFERENCES "insurance_company" ("id");

ALTER TABLE "casualty_insurance" ADD FOREIGN KEY ("insurance_company_id") REFERENCES "insurance_company" ("id");

ALTER TABLE "building_insurance" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "building_insurance" ADD FOREIGN KEY ("insurance_id") REFERENCES "casualty_insurance" ("id");

ALTER TABLE "proprty_unit_insurance" ADD FOREIGN KEY ("property_unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "proprty_unit_insurance" ADD FOREIGN KEY ("insurance_id") REFERENCES "casualty_insurance" ("id");

ALTER TABLE "country_subdivision_visit" ADD FOREIGN KEY ("country_subdivision_id") REFERENCES "country_subdivision" ("id");

ALTER TABLE "country_subdivision_visit" ADD FOREIGN KEY ("incident_id") REFERENCES "incident" ("id");

ALTER TABLE "country_subdivision_visit" ADD FOREIGN KEY ("agent_id") REFERENCES "user" ("id");

ALTER TABLE "incident_localized" ADD FOREIGN KEY ("incident_id") REFERENCES "incident" ("id");

ALTER TABLE "building_image" ADD FOREIGN KEY ("building_id") REFERENCES "building" ("id");

ALTER TABLE "property_unit_image" ADD FOREIGN KEY ("property_unit_id") REFERENCES "property_unit" ("id");

ALTER TABLE "user_login_history" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

COMMENT ON TABLE "role" IS 'e.g. Admin, Agent, Observer, ';

COMMENT ON COLUMN "role_localized"."locale" IS 'e.g. en-GB or fa-IR';

COMMENT ON TABLE "country_subdivision_type" IS 'name is inside country_subdivision_localized';

COMMENT ON TABLE "country_subdivision" IS 'We put actual subdivisions here:
  e.g. اصفهان، بجنورد
  Bern, 
  
  Relation is one to many, a division can be controlled by just one admin';

COMMENT ON COLUMN "country_subdivision"."subdivision_name" IS 'the default name, e.g. اصفهان in persian.
  localized name is in country_subdivision_localized';

COMMENT ON COLUMN "country_subdivision"."amar_village_code" IS 'کد آبادی';

COMMENT ON COLUMN "country_subdivision"."building_unit_count" IS 'تعداد واحد مسکونی';

COMMENT ON COLUMN "country_subdivision"."is_residency_permanent" IS 'وضعیت اسکان دائمی یا فصلی';

COMMENT ON COLUMN "country_subdivision"."cathedra_type_id" IS 'کرسی چینی همسطح زمین یا بالاتر از سطح زمین';

COMMENT ON COLUMN "country_subdivision"."is_one_story" IS 'یک طبقه یا چند طبقه';

COMMENT ON COLUMN "country_subdivision"."controlled_by_admin" IS 'admins may have many areas in their control';

COMMENT ON TABLE "cathedra_type" IS 'کرسی چینی';

COMMENT ON COLUMN "village_damage"."persian_date_picked" IS '1398/01/01';

COMMENT ON TABLE "departure_type" IS 'به خارج یا کانکس';

COMMENT ON TABLE "incident_action" IS 'چادر یا واحد مسکونی';

COMMENT ON TABLE "country_subdivision_danger" IS 'روستا در معبر مسیل واقع است';

COMMENT ON COLUMN "village_access_route"."name" IS 'نام جاده';

COMMENT ON COLUMN "road_type"."name" IS 'آسفالته یا شوسه یا خاکی';

COMMENT ON COLUMN "road_access"."length_to_other_road" IS 'برحسب کیلومتر';

COMMENT ON TABLE "village_education" IS 'تعداد هر مدرسته یا دبیرستان';

COMMENT ON TABLE "educational_subdivision" IS 'دبستان و دبیرستان';

COMMENT ON TABLE "village_sanitation" IS 'درمانگاه و خانه بهداشت';

COMMENT ON TABLE "facility" IS 'مثلا تاسیسات آب لوله‌کشی و برق';

COMMENT ON COLUMN "area_size_unit"."name" IS 'متر مربع یا هکتار یا فوت‌مربع یا جریب';

COMMENT ON COLUMN "area_size_unit_localized"."name" IS 'متر مربع یا هکتار یا فوت‌مربع یا جریب';

COMMENT ON TABLE "foundation_type" IS 'مثل بتن آرمه';

COMMENT ON TABLE "property_unit" IS 'visits are saved in building_visit table for each unit';

COMMENT ON COLUMN "unit_residency_type"."name" IS 'تجاری مسکونی';

COMMENT ON COLUMN "unit_residency_type_localized"."name" IS 'تجاری مسکونی';

COMMENT ON TABLE "construction_material" IS 'گلی، بتن‌آرمه، بنایی، فلزی';

COMMENT ON TABLE "building_construction" IS 'buildings may have two types of materials. e.g. Brick house, ';

COMMENT ON COLUMN "building_visit"."referrence_code" IS 'کدی که ایجاد کرده و در اختیار صاحب ملک می‌گذاریم تا بعدها از این طریق پیگیری کند.';

COMMENT ON COLUMN "building_visit"."has_objected" IS 'اگر صاحب ملک به این فرم اعتراض داشته';

COMMENT ON COLUMN "building_visit"."agent_id" IS 'The agent who visited this unit';

COMMENT ON TABLE "subscribtion" IS 'مثلا انشعاب آب یا اشتراک برق';

COMMENT ON COLUMN "property_unit_visit"."water_level" IS 'ارتفاع داغی آب';

COMMENT ON COLUMN "property_unit_visit"."stage_number" IS 'مرحله چندم بررسی ساختمان';

COMMENT ON COLUMN "property_unit_visit"."referrence_code" IS 'کدی که ایجاد کرده و در اختیار صاحب ملک می‌گذاریم تا بعدها از این طریق پیگیری کند.';

COMMENT ON COLUMN "property_unit_visit"."has_objected" IS 'اگر صاحب ملک به این فرم اعتراض داشته';

COMMENT ON COLUMN "property_unit_visit"."agent_id" IS 'The agent who visited this unit';

COMMENT ON TABLE "charitable_organization" IS 'کمیته امداد، بهزیستی';

COMMENT ON TABLE "ownership_type" IS 'مثل ورثه‌ای ، سندی، قولنامه‌ای';

COMMENT ON COLUMN "building_ownership"."share_percentage" IS 'مثلا ۶.۲ یعنی ۶ دانگ و ۲ حبه';

COMMENT ON COLUMN "building_ownership"."share_percentage_type_id" IS 'مثلا دانگ یا درصد';

COMMENT ON COLUMN "property_unit_ownership"."share_percentage" IS 'مثلا ۶.۲ یعنی ۶ دانگ و ۲ حبه';

COMMENT ON COLUMN "property_unit_ownership"."share_percentage_type_id" IS 'مثلا دانگ یا درصد';

COMMENT ON TABLE "residency" IS 'سکونت یک خانوار در یک واحد ملکی را نشان می‌دهد';

COMMENT ON COLUMN "residency"."is_main" IS 'مثلا سکونت این شخص در بخضی از واحد نمود یک خانوار فرعی است یا اصلی';

COMMENT ON TABLE "settlement_danger" IS 'مثل حریم رودخانه، مسیل';

COMMENT ON COLUMN "damage_reason"."name" IS 'مثل سیل و زلزله';

COMMENT ON COLUMN "damage_type"."name" IS 'مثل احداثی نوع ۱ و غیره';

COMMENT ON COLUMN "insurance_company"."name" IS 'بیمه پارسیان';

COMMENT ON COLUMN "insurance_company_localized"."name" IS 'Parsian Insurance Co.';

COMMENT ON COLUMN "casualty_insurance"."insurance_rate" IS 'سقف مبلغ بیمه';

COMMENT ON TABLE "country_subdivision_visit" IS 'فرم روستا';

COMMENT ON COLUMN "country_subdivision_visit"."referrence_code" IS 'کدی که ایجاد کرده و در اختیار صاحب ملک می‌گذاریم تا بعدها از این طریق پیگیری کند.';

COMMENT ON COLUMN "country_subdivision_visit"."has_objected" IS 'اگر صاحب ملک به این فرم اعتراض داشته';

COMMENT ON COLUMN "country_subdivision_visit"."agent_id" IS 'The agent who visited this unit';

COMMENT ON TABLE "building_image" IS 'شامل پلانی که مامور از طریق برنامه می‌کشد هم می‌شود. اما می‌تواند تصاویری از ساختمان باشد که مامور رسم کرده';

COMMENT ON TABLE "property_unit_image" IS 'شامل پلانی که مامور از طریق برنامه می‌کشد هم می‌شود. اما می‌تواند تصاویری از واحد ملکی باشد که مامور رسم کرده';
