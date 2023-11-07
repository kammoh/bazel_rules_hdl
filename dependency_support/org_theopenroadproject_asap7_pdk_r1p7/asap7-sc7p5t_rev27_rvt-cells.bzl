# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

<<<<<<<< HEAD:dependency_support/org_theopenroadproject_asap7_pdk_r1p7/asap7-sc7p5t_rev27_rvt-cells.bzl
# ASAP7 "rev 27" 7.5 track standard cell library using regular VT transistors
# ------------------------------------------------------------------------
asap7_cells_files(
    name = "asap7-cells-sc7p5t_rev27_rvt",
    rev = "27",
    tracks = "7p5t",
    vt = "rvt",
    has_gds = True,
========
"""Arizona State University 7nm PDK"""

load("@rules_hdl//pdk:open_road_configuration.bzl", "open_road_pdk_configuration")
load("@rules_hdl//dependency_support/org_theopenroadproject_asap7_pdk_r1p7:asap7.bzl", "asap7_cell_library")

asap7_cell_library(
    name = "asap7_rvt_1x",
    srcs = glob(["LIB/CCS/*.lib.7z"]),
    cell_lef = "LEF/asap7sc7p5t_28_R_1x_220121a.lef",
    cell_type = "RVT",
    platform_gds = "GDS/asap7sc7p5t_28_R_220121a.gds",
    default_corner_delay_model = "ccs",
    default_corner_swing = "SS",
    openroad_configuration = ":open_road_asap7_1x",
    tech_lef = "techlef_misc/asap7_tech_1x_201209.lef",
    visibility = [
        "//visibility:public",
    ]
>>>>>>>> temp-fix-asap7:dependency_support/org_theopenroadproject_asap7sc7p5t_28/bundled.BUILD.bazel
)

open_road_pdk_configuration(
    name = "open_road-asap7-sc7p5t_rev27_rvt",
    cell_site = "asap7sc7p5t",
    cts_buffer_cell = "BUFx4_ASAP7_75t_R",
    do_not_use_cell_list = [
        "*x1_ASAP7*",
        "*x1p*_ASAP7*",
        "*xp*_ASAP7*",
        "SDF*",
        "ICG*",
        "DFFH*",
    ],
    endcap_cell = "TAPCELL_ASAP7_75t_R",
    fill_cells = [
        "FILLERxp5_ASAP7_75t_R",
        "DECAPx1_ASAP7_75t_R",
        "DECAPx2_ASAP7_75t_R",
        "DECAPx4_ASAP7_75t_R",
        "DECAPx6_ASAP7_75t_R",
        "DECAPx10_ASAP7_75t_R",
    ],
    global_placement_cell_pad = 2,
    global_routing_clock_layers = "M2-M7",
    global_routing_layer_adjustments = {
        "M2": "0.5",
        "M3": "0.5",
        "M4": "0.5",
        "M5": "0.5",
        "M6": "0.5",
        "M7": "0.5",
    },
    global_routing_signal_layers = "M2-M7",
<<<<<<<< HEAD:dependency_support/org_theopenroadproject_asap7_pdk_r1p7/asap7-sc7p5t_rev27_rvt-cells.bzl
    klayout_tech_file = "@rules_hdl//dependency_support/org_theopenroadproject_asap7:asap7.lyt",
    pdn_config = "@rules_hdl//dependency_support/org_theopenroadproject_asap7:pdn_config_1x.pdn",
========
    klayout_tech_file = "@rules_hdl//dependency_support/org_theopenroadproject_asap7_pdk_r1p7:asap7.lyt",
    pdn_config = "@rules_hdl//dependency_support/org_theopenroadproject_asap7_pdk_r1p7:pdn_config.pdn",
>>>>>>>> temp-fix-asap7:dependency_support/org_theopenroadproject_asap7sc7p5t_28/bundled.BUILD.bazel
    pin_horizontal_metal_layer = "M4",
    pin_vertical_metal_layer = "M5",
    rc_script_configuration = "@rules_hdl//dependency_support/org_theopenroadproject_asap7_pdk_r1p7:rc_script.tcl",
    tap_cell = "TAPCELL_ASAP7_75t_R",
    tapcell_distance = 25,
    tie_high_port = "TIEHIx1_ASAP7_75t_R/H",
    tie_low_port = "TIELOx1_ASAP7_75t_R/L",
    tie_separation = 0,
    tracks_file = "@rules_hdl//dependency_support/org_theopenroadproject_asap7_pdk_r1p7:tracks.tcl",
    wire_rc_clock_metal_layer = "M5",
    wire_rc_signal_metal_layer = "M2",
)
