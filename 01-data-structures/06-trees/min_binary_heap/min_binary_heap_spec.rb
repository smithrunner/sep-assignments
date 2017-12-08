include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 99) }

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

  describe '#insert(data)' do
    it "properly sorts tree" do
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      tree.insert(root, jedi)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      
      expect(root.title).to eq "mad_max_2"
    end
    
    
      
  end

end