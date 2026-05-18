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

variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "location" {
  description = "The location of the Agent Registry resource (e.g., us-central1)."
  type        = string
}

variable "filter" {
  description = "A filter string to find the Agent (e.g., 'display_name=\"my-agent\"')."
  type        = string
  default     = null
}

variable "agent_id" {
  description = "The system-generated ID for a registered agent."
  type        = string
  default     = null
}

variable "module_depends_on" {
  description = "A list of external resources or modules that this module should depend on."
  type        = list(string)
  default     = []
}

variable "wait_time" {
  description = "A dynamic wait time to delay agent data fetching, specified as a string (e.g., '10s'). Defaults to '0s'."
  type        = string
  default     = "0s"
}
