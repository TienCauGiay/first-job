﻿using System;
using System.Collections.Generic;

namespace ShopBanMyPham.Models;

public partial class ReceiptDetail
{
    public int ReceiptDetailId { get; set; }

    public int ReceiptId { get; set; }

    public int ProductId { get; set; }

    public int? SellNumber { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual Receipt Receipt { get; set; } = null!;
}
