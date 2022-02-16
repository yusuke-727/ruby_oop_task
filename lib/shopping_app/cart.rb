require_relative "item_manager"

class Cart
  include ItemManager

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    # Override the items method of ItemManager so that the Cart's items become its own @items.
    # When a Cart instance has an Item instance, it just stores it in its own @items (Cart#add) without letting the owner authority transfer.
    @items
  end

  def add(item)
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end

  def check_out
    return if owner.wallet.balance < total_amount
  # Requirements
  # - The purchase amount of all items in the cart（Cart#items）is transferred from the cart owner's wallet to the item owner's wallet.
  # - The owner rights of all items in the cart（Cart#items）are transferred to the cart owner.
  # - The contents of the cart（Cart#items）are emptied.

  # Hints
  # - Wallet of the owner of the cart ==> self.owner.wallet
  # - Item owner's wallet ==> item.owner.wallet
  # - Money being transferred ==> withdrawing the amount from someone's wallet and depositing the amount into someone else's wallet
  # - The owner of the item is transferred to the owner of the cart ==> The owner is rewritten (item.owner = ?)
  end

end
