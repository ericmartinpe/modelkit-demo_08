ep_dir = "C:/EnergyPlusV8-9-0"
modelkit_dir = "~/Documents/Modelkit Catalyst/"
template_dir = modelkit_dir + "templates/net-zero-templates/templates"
weather_dir = template_dir + "/weather/"
main_dir = File.expand_path(File.dirname(__FILE__)) # main_dir is the directory of this rakefile
runs_dir = main_dir + "/runs/"
cases_dir = main_dir + "/parameters/cases/"

locations = ['CZ01','CZ02','CZ03','CZ04','CZ05','CZ06','CZ07','CZ08','CZ09','CZ10','CZ11','CZ12','CZ13','CZ14','CZ15','CZ16']
locations =['CZ01']

desc "Generate case files"
task :cases do
  for location in locations
    puts "  Generating case files for: #{location}"
    pxv_path = cases_dir + "#{location}.pxv"
    pxv_string = ""
    pxv_string << ":location=>\"#{location}\""
    File.write(pxv_path, pxv_string)
  end
end

desc "Compose models from case files"
task :compose do
  for location in locations
    pxv_path = cases_dir + "#{location}.pxv"
    puts "  Composing Case: #{location}"
    output_dir = runs_dir + "#{location}/"
    output_path = output_dir + "instance.idf"
    root_dir = main_dir + "/templates/"
    root_path = root_dir + "root.pxt"
    system "modelkit template-compose  --files=\"#{pxv_path}\" --output=\"#{output_path}\" \"#{root_path}\""
  end
end

desc "Simulate models in the runs directory"
task :sim do
  for location in locations
    output_dir = runs_dir + "#{location}/"
    output_path = output_dir + "instance.idf"
    weather_path = weather_dir + "#{location}.epw"
    system "modelkit-energyplus energyplus-run --weather=\"#{weather_path}\" \"#{output_path}\""
  end
end
