require 'chef/mixin/language_include_recipe'

class Chef
  module Mixin
    module LanguageIncludeRecipe
      def include_recipe_smartly(*list_of_recipes)
        for recipe in list_of_recipes
          included=false
          for dependency in BarclampLibrary::Barclamp::DependsOn.get(recipe)
            if BarclampLibrary::Barclamp::Config.has_changes_to_apply(dependency)
              Chef::Log.info("smart including recipe: #{recipe}")
              Chef::Log.debug("due to change in: #{dependency}")
              include_recipe recipe
              included=true
              break
            end # if
          end # for
          Chef::Log.info("recipe excluded: #{recipe}") unless included
        end # for
      end # def include_recipe_smartly
    end
  end
end

