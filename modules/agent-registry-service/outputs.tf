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

data "google_project" "project" {
  project_id = var.project_id
}

output "id" {
  description = "The ID of the Agent Registry Service."
  value       = google_agent_registry_service.this.id
}

output "create_time" {
  description = "The timestamp when the resource was created."
  value       = google_agent_registry_service.this.create_time
}

output "update_time" {
  description = "The timestamp when the resource was updated."
  value       = google_agent_registry_service.this.update_time
}

output "agent" {
  description = "Details of the Agent configuration."
  value       = length(google_agent_registry_service.this.agent_spec) > 0 ? google_agent_registry_service.this.agent_spec[0] : null
}

output "mcp_server" {
  description = "Details of the MCP Server configuration."
  value       = length(google_agent_registry_service.this.mcp_server_spec) > 0 ? google_agent_registry_service.this.mcp_server_spec[0] : null
}

output "endpoint" {
  description = "Details of the Endpoint configuration."
  value       = length(google_agent_registry_service.this.endpoint_spec) > 0 ? google_agent_registry_service.this.endpoint_spec[0] : null
}

output "display_name" {
  description = "The user-defined display name of the service."
  value       = google_agent_registry_service.this.display_name
}

output "discovery_filter" {
  description = "A pre-formatted filter string for discovery modules."
  value = format("%s:\"urn:%s:projects-%s:projects:%s:locations:%s:agentregistry:services:%s\"",
    length(google_agent_registry_service.this.agent_spec) > 0 ? "agentId" : (length(google_agent_registry_service.this.mcp_server_spec) > 0 ? "mcpServerId" : "endpointId"),
    length(google_agent_registry_service.this.agent_spec) > 0 ? "agent" : (length(google_agent_registry_service.this.mcp_server_spec) > 0 ? "mcp" : "endpoint"),
    data.google_project.project.number,
    data.google_project.project.number,
    var.location,
    basename(google_agent_registry_service.this.id)
  )

  depends_on = [
    google_agent_registry_service.this,
    time_sleep.wait_after_registration
  ]
}
