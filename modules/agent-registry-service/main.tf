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

resource "google_agent_registry_service" "this" {
  provider     = google-nightly
  location     = var.location
  service_id   = var.service_id
  project      = var.project_id
  display_name = var.display_name
  description  = var.description

  dynamic "interfaces" {
    for_each = var.interfaces
    content {
      url              = interfaces.value.url
      protocol_binding = interfaces.value.protocol_binding
    }
  }

  # The following blocks are mutually exclusive as per the 'exactly_one_of' constraint
  dynamic "agent_spec" {
    for_each = var.agent_spec != null ? [var.agent_spec] : []
    content {
      type    = agent_spec.value.type
      content = agent_spec.value.content
    }
  }

  dynamic "mcp_server_spec" {
    for_each = var.mcp_server_spec != null ? [var.mcp_server_spec] : []
    content {
      type    = mcp_server_spec.value.type
      content = mcp_server_spec.value.content
    }
  }

  dynamic "endpoint_spec" {
    for_each = var.endpoint_spec != null ? [var.endpoint_spec] : []
    content {
      type = endpoint_spec.value.type
    }
  }
}

# time change is done in order to remove the flacky ness in resouce not found in case of immediate registration
resource "time_sleep" "wait_after_registration" {
  depends_on      = [google_agent_registry_service.this]
  create_duration = "5s"
}
