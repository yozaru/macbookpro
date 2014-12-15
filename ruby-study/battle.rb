#戦闘クラス
class Battle
 #ゲーム開始
 def attack
 damege = 3
    puts yo.name + "の攻撃！！ %iのダメージ" % damage
    yo.hitpoint = yo.hitpoint - damage

    puts aya.name + "の攻撃！！ %iのダメージ" % damage
    @aya.hitpoint = aya.hitpoint - damage
    puts ""

    @player.dead? or @monster.dead? # どちらかのキャラクターの hp が無くなったかの判定
    end
end
