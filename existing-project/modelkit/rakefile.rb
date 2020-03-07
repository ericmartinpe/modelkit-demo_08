ep_dir = "C:/EnergyPlusV8-9-0"
modelkit_dir = "~/Documents/Modelkit Catalyst/"
template_dir = modelkit_dir + "templates/net-zero-templates/templates"
main_dir = File.expand_path(File.dirname(__FILE__)) # main_dir is the directory of this rakefile
weather_dir = main_dir + "/templates/weather/"
runs_dir = main_dir + "/runs/"
cases_dir = main_dir + "/parameters/cases/"

locations = ['USA_CO_Aurora-Buckley.Field.ANGB.724695_TMY3']
runs =['base','prop']

desc "Compose models from case files"
task :compose do
  for run in runs
    pxv_path = cases_dir + "#{run}.pxv"
    puts "  Composing Case: #{run}"
    output_dir = runs_dir + "#{run}/"
    output_path = output_dir + "instance.idf"
    root_dir = main_dir + "/templates/"
    root_path = root_dir + "root.pxt"
    system "modelkit template-compose  --files=\"#{pxv_path}\" --output=\"#{output_path}\" \"#{root_path}\""
  end
end

desc "Simulate models in the runs directory"
task :sim do
  for run in runs
    output_dir = runs_dir + "#{run}/"
    output_path = output_dir + "instance.idf"
    weather_path = weather_dir + "#{locations[0]}.epw"
    puts weather_path
    system "modelkit-energyplus energyplus-run --weather=\"#{weather_path}\" \"#{output_path}\""
  end
end
