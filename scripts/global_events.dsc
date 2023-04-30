fort_global_handler:
  type: world
  debug: false
  events:

    on player clicks in inventory:
    - define slot <context.slot>
    #-resources
    - if <list[19|20|21].contains[<[slot]>]>:
      - determine passively
      - stop

    on block drops item from breaking:
    - stop if:<context.location.world.name.equals[fortnite_map].not>
    - determine cancelled

    on player damaged by FALL:
    #you take half the fall damage now
    - define damage <context.damage.div[2]>
    #that way the annoying head thing doesn't happen when falling by the smallest amount
    - if <[damage]> < 2:
      - determine passively cancelled
      - stop

    - determine <[damage]>

    on player changes food level:
    - determine cancelled

    on player heals:
    - determine cancelled