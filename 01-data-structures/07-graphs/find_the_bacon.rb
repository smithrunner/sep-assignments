require_relative 'find_bacon'

kevin_Bacon = Node.new('Kevin Bacon')

#walter mitty
kristen_Wiig = Node.new('Kristen Wiig')
ben_Stiller = Node.new('Ben Stiller')
adam_Scott = Node.new('Adam Scott')
patton_Oswalt = Node.new('Patton Oswalt')
sean_Penn = Node.new('Sean Penn')

kristen_Wiig.film_actor_hash['walter mitty'] = [ben_Stiller, adam_Scott, patton_Oswalt, sean_Penn]
ben_Stiller.film_actor_hash['walter mitty'] = [adam_Scott, patton_Oswalt, sean_Penn, kristen_Wiig]
adam_Scott.film_actor_hash['walter mitty'] = [patton_Oswalt, sean_Penn, kristen_Wiig, ben_Stiller]
patton_Oswalt.film_actor_hash['walter mitty'] = [sean_Penn, kristen_Wiig, ben_Stiller, adam_Scott]
sean_Penn.film_actor_hash['walter mitty'] = [kristen_Wiig, ben_Stiller, adam_Scott, patton_Oswalt]


#Tropic Thunder
jack_Black = Node.new('Jack Black')
bill_Hader = Node.new('Bill Hader')
robert_Downey = Node.new('Robert Downey')
tom_Cruise = Node.new('Tom Cruise')
matt_Mcconaughey = Node.new('Matt McConaughey')

ben_Stiller.film_actor_hash['tropic thunder'] = [jack_Black, bill_Hader, robert_Downey, tom_Cruise, matt_Mcconaughey]
jack_Black.film_actor_hash['tropic thunder'] = [bill_Hader, robert_Downey, tom_Cruise, matt_Mcconaughey, ben_Stiller]
bill_Hader.film_actor_hash['tropic thunder'] = [robert_Downey, tom_Cruise, matt_Mcconaughey, ben_Stiller, jack_Black]
robert_Downey.film_actor_hash['tropic thunder'] = [tom_Cruise, matt_Mcconaughey, ben_Stiller, jack_Black, bill_Hader]
tom_Cruise.film_actor_hash['tropic thunder'] = [matt_Mcconaughey, ben_Stiller, jack_Black, bill_Hader, robert_Downey]
matt_Mcconaughey.film_actor_hash['tropic thunder'] = [ben_Stiller, jack_Black, bill_Hader, robert_Downey, tom_Cruise]

#A Few Good Men
jack_Nicholson = Node.new('Jack Nicholson')
demi_Moore = Node.new('Demi Moore')
kevin_Pollak = Node.new('Kevin Pollak')
cuba_Gooding = Node.new('Cuba Gooding')

kevin_Bacon.film_actor_hash['a few good men'] = [tom_Cruise, jack_Nicholson, demi_Moore, kevin_Pollak, cuba_Gooding]
tom_Cruise.film_actor_hash['a few good men'] = [jack_Nicholson, demi_Moore, kevin_Pollak, cuba_Gooding, kevin_Bacon]
jack_Nicholson.film_actor_hash['a few good men'] = [demi_Moore, kevin_Pollak, cuba_Gooding, kevin_Bacon, tom_Cruise]
demi_Moore.film_actor_hash['a few good men'] = [kevin_Pollak, cuba_Gooding, kevin_Bacon, tom_Cruise, jack_Nicholson]
kevin_Pollak.film_actor_hash['a few good men'] = [cuba_Gooding, kevin_Bacon, tom_Cruise, jack_Nicholson, demi_Moore]
cuba_Gooding.film_actor_hash['a few good men'] = [kevin_Bacon, tom_Cruise, jack_Nicholson, demi_Moore, kevin_Pollak]

#Kristen Wiig to Kevin Bacon
# Answer should be: Walter Mitty(ben stiller) -> Tropic Thunder(Tom cruise) -> A Few Good men(Kevin Bacon)

bacon = FindBacon.new

puts bacon.find_kevin_bacon(kristen_Wiig,kevin_Bacon)