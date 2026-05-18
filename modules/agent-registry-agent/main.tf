/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "time_sleep" "wait_for_auto_registration_for_agent_in_registry" {
  provider        = time
  create_duration = var.wait_time
  depends_on      = [var.module_depends_on]
}

data "google_agent_registry_agent" "default" {
  provider   = google-nightly
  project    = var.project_id
  location   = var.location
  agent_id   = var.agent_id
  filter     = var.filter
  depends_on = [time_sleep.wait_for_auto_registration_for_agent_in_registry]
}
