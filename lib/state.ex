defmodule GameState do
  def new() do
    mobs =
      Enum.map(1..30, fn id ->
        %{
          id: id, x: :rand.uniform(100), y: :rand.uniform(100), type: :rand.uniform(3),
          hp: 100
        }
      end)

    %{mobs: mobs}
  end

  def tick(gs) do
    %{
      gs
      | mobs:
          Enum.map(gs.mobs, fn x ->
            #if there is something around, attack, else random move
            random_move_mob(x)
          end)
    }
  end

  def random_move_mob(mob) do
    %{mob | x: rem(mob.x + :rand.uniform(3) - 2, 100), y: rem(mob.y + :rand.uniform(3) - 2, 100)}
  end
end
