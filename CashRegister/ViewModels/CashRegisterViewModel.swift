//
//  CashRegisterViewModel.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import Foundation

class CashRegisterViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Hat", price: 10, quantity: 10),
        Product(name: "Shirt", price: 20, quantity: 5),
        Product(name: "Jeans", price: 50, quantity: 8)
    ]
    
    @Published var history: [Purchase] = []
    @Published var selectedProduct: Product? = nil
    @Published var selectedQuantity: String = ""
    
    func buyProduct() {
        guard let product = selectedProduct, let quantity = Int(selectedQuantity) else { return }
        guard quantity > 0 && quantity <= product.quantity else { return }
        
        // Update stock
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity -= quantity
            
            // Save purchase to history
            let purchase = Purchase(name: product.name, quantity: quantity, totalPrice: Double(quantity) * product.price, date: Date())
            history.append(purchase)
        }
        
        // Reset selection
        selectedProduct = nil
        selectedQuantity = ""
    }
    
    func restockProduct(product: Product, amount: Int) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += amount
        }
    }
}
