#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require_relative 'workflow_config.rb'
require 'alfred-3_workflow'

filter = ARGV[0].to_s.downcase

# config / data
config = WorkflowConfig.new

displays = config.get_displays

select_display = nil
current_display = nil

workflow = Alfred3::Workflow.new

begin
  if displays.length < 2
    current_display = 0
    select_display = false
  else
    current_display, noop, filter = filter.match(/^(\d+)(\s+)?(.+)?/).captures
    current_display = current_display.to_i
    select_display = false
    raise Exception unless displays[current_display]
  end
rescue
  select_display = true
end

if select_display
  displays.each_with_index do |display, index|
    fb.add_item({
                  #:uid => mode['id'],
                  :title => "Display: #{display[:name]}",
                  :subtitle => "Change resolution for display #{display[:name]}",
                  :arg => index,
                  :valid => 'yes',
                })
  end
else
  # get current resolution
  current_resolution = config.get_current_resolution current_display

  # get resolution list
  resolutions = config.get_resolutions current_display

  # removes current resolution
  resolutions = resolutions.delete_if { |mode| mode[:id] == current_resolution[:id] }

  # search filter if present
  if filter
    resolutions.reject! do |mode|
      true unless mode[:id] =~ /#{filter}/
    end
  end

  if resolutions.length > 0
    # if there's no filter
    if filter =~ /^\s*$/
      # adds current resolution as non actionable item
      workflow.result
        .title("Current Resolution: #{current_resolution[:width]}x#{current_resolution[:height]} at #{current_resolution[:dpi]}")
        .subtitle('Select a new resolution from the list or type to search')
        .valid(false)
    end

    # iterates and performs search filter if present
    resolutions.each do |mode|
      workflow.result
        .title("Switch to #{mode[:width]}x#{mode[:height]} at #{mode[:dpi]}")
        .subtitle("Change resolution to #{mode[:width]} width and #{mode[:height]} height at #{mode[:dpi]} mode")
        .arg(mode[:id])
        .valid(true)
    end
  else
    workflow.result
      .uuid('')
      .title('No results for your search')
      .subtitle('No screen resolution found for your input search')
      .valid(false)
  end
end

print workflow.output


