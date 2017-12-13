include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe 'min heap' do
    specify {
      expect_output = "printing min heap\nnil\nPacific Rim: 72\nBraveheart: 78\nInception: 86\nDonnie Darko: 85\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(district)
      tree.insert(shawshank)
      tree.insert(martian)
      tree.insert(hope)
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect { tree.print_heap }.to output(expect_output).to_stdout
    }
  end
end