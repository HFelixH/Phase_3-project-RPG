class Dungeon
  attr_accessor :current_dungeon, :number_of_dungeons_entered

  def initialize
    @current_dungeon = ''
    @number_of_dungeons_entered = 1
    @content = get_content
  end

  def interact(player)
    if @content
      @content.interact(player)
      @content = nil
    elsif @content.nil?
      puts 'There is nothing here, move on.'
      @content = get_content
    end
  end

  def enter_dungeon
    @current_dungeon = Dungeon.new
    @number_of_dungeons_entered += 1
  end

  private

  def get_content
    [Monster, Item].sample.new
  end
end
