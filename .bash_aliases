# Aliases

# Alias alias
alias cataliases='cat ~/.bash_aliases'

# Aliases Symfony
# AjaxMakerBundle
alias ajax:make:ajax='php bin/console ajax:make:ajax'
alias ajax:make:controller='php bin/console ajax:make:controller'
alias ajax:make:crud='php bin/console ajax:make:crud'
alias ajax:make:entity='php bin/console ajax:make:entity'
alias ajax:make:forms='php bin/console ajax:make:forms'
alias ajax:make:migration='php bin/console ajax:make:migration'
alias ajax:make:twig:templates='php bin/console ajax:make:twig:templates'
# Cache
alias cache:clear='php bin/console cache:clear'
alias cache:clear:prod='php bin/console cache:clear --env=prod'
# Composer
alias composer:prod='composer install --no-dev --optimize-autoloader'
# Debug
alias debug:autowiring='php bin/console debug:autowiring'
alias debug:config='php bin/console debug:config'
alias debug:container='php bin/console debug:container'
alias debug:form='php bin/console debug:form'
alias debug:router='php bin/console debug:router'
alias debug:translation='php bin/console debug:translation'
alias debug:twig='php bin/console debug:twig'
# Doctrine
alias load:fixtures='time php -d max_execution_time=0 -d memory_limit=-1 bin/console gpao:load:json-fixtures'
alias logandload:fixtures='load:fixtures > fixtures.log'
alias load:fixtures:loggers='time php -d max_execution_time=0 -d memory_limit=-1 bin/console gpao:load:json-fixtures --loggers'
alias logandload:fixtures:loggers='load:fixtures:loggers > fixtures.log'
alias append:fixtures='php bin/console doctrine:fixtures:load --append'
alias migrations:migrate='php bin/console doctrine:migrations:migrate'
alias schema:drop='time php bin/console doctrine:schema:drop -f'
alias schema:update='time php bin/console doctrine:schema:update -f'
# GPAO
alias gpao:fix:code='php bin/console gpao:fix:code'
alias gpao:make:loggers='php bin/console gpao:make:loggers'
# Server
alias server:start='php bin/console server:start'
alias server:stop='php bin/console server:stop'
# Cypress
alias cypress:generate='php bin/console gpao:cypress:generate'
# Workflow
dump_workflow() {
    php bin/console workflow:dump $1 | dot -Tpng -o "$1.png"
}
alias dump:workflow='dump_workflow'
