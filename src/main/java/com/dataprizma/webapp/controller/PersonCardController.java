package com.dataprizma.webapp.controller;

import com.dataprizma.Constants;
import com.dataprizma.dao.SearchException;
import com.dataprizma.model.PersonCard;
import com.dataprizma.model.Product;
import com.dataprizma.model.ProductLine;
import com.dataprizma.model.ProductType;
import com.dataprizma.service.PersonCardManager;
import com.dataprizma.service.ProductManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by Admin on 28/02/2015.
 */
@Controller
public class PersonCardController extends BaseFormController {
    private PersonCardManager personCardManager;
    private ProductManager productManager;

    @Autowired
    public void setPersonCardManager(PersonCardManager personCardManager) {
        this.personCardManager = personCardManager;
    }

    @Autowired
    public void setProductManager(ProductManager productManager) {
        this.productManager = productManager;
    }

    @RequestMapping(value = "/personcards", method = RequestMethod.GET)
    public ModelAndView onSearch(@RequestParam(required = false, value = "q") String query) throws Exception {
        Model model = new ExtendedModelMap();
        model.addAttribute(Constants.PERSON_CARD_LIST, personCardManager.searchByWord(query));
        return new ModelAndView("personCardList", model.asMap());
    }

    @RequestMapping(value = "/anketa", method = RequestMethod.GET)
    public ModelAndView viewAnketa(@RequestParam(value = "id") Long id) throws Exception {
        PersonCard personCard = personCardManager.get(id);

        Model model = new ExtendedModelMap();
        model.addAttribute("personCard", personCard);
        model.addAttribute("sex", (personCard.getSex() == 1 ? "Мужчин" : "Женщин"));
        model.addAttribute("ap", getAp(personCard.getTestPsix().getAp()));
        model.addAttribute("bmi", getBMI(personCard.getBmi()));
        model.addAttribute("bov", getBOV(personCard));
        if (personCard.getProductLines().isEmpty()) {
            personCard.setProductLines(generateProductLines(getBOV(personCard), personCard));
            personCardManager.save(personCard);
        }

        model.addAttribute("lineList1", parseMenu(personCard.getProductLines().subList(0, 4)));
        model.addAttribute("lineList2", parseMenu(personCard.getProductLines().subList(4, 5)));
        model.addAttribute("lineList3", parseMenu(personCard.getProductLines().subList(5, 9)));
        model.addAttribute("lineList4", parseMenu(personCard.getProductLines().subList(9, 10)));
        model.addAttribute("lineList5", parseMenu(personCard.getProductLines().subList(10, 12)));
        model.addAttribute("lastRowTotal", parLastRow(personCard.getProductLines()));

        model.addAttribute("ifs", getIFS(personCard));
        model.addAttribute("stress", getStress(personCard));
        model.addAttribute("stressvalue", getStressValue(personCard));
        model.addAttribute("isCardiolog", isCardiolog(personCard));
        model.addAttribute("isNevropotolog", isNevropotolog(personCard));
        model.addAttribute("isGastro", isGastro(personCard));
        return new ModelAndView("anketa", model.asMap());
    }

    private List<MenuDto> parseMenu(List<ProductLine> productLines) {
        List<MenuDto> menuDtos = new ArrayList<>();
        for (ProductLine productLine : productLines) {
            double quantity = productLine.getQuantity();
            double belki = productLine.getProduct().getBelki() * quantity * 0.01;
            double jiri = productLine.getProduct().getJiri() * quantity * 0.01;
            double uglevodi = productLine.getProduct().getUglevodi() * quantity * 0.01;
            double kkal = productLine.getProduct().getKkal() * quantity * 0.01;
            menuDtos.add(new MenuDto(productLine.getProduct().getName(), quantity, belki, jiri, uglevodi, kkal));
        }
        return menuDtos;
    }

    private MenuDto parLastRow(List<ProductLine> productLines) {
        MenuDto total = new MenuDto();
        total.setName("ИТОГО");
        for (ProductLine productLine : productLines) {
            double quantity = productLine.getQuantity();
            double belki = productLine.getProduct().getBelki() * quantity * 0.01;
            double jiri = productLine.getProduct().getJiri() * quantity * 0.01;
            double uglevodi = productLine.getProduct().getUglevodi() * quantity * 0.01;
            double kkal = productLine.getProduct().getKkal() * quantity * 0.01;
            total.setQuantity(total.getQuantity() + quantity);
            total.setBelki(total.getBelki() + belki);
            total.setJiri(total.getJiri() + jiri);
            total.setUglevodi(total.getUglevodi() + uglevodi);
            total.setKkal(total.getKkal() + kkal);
        }
        return total;
    }

    private List<ProductLine> generateProductLines(double bov, PersonCard personCard) {
        Random random = new Random();
        List<ProductLine> productLines = new ArrayList<>();
        List<Product> allProducts = new ArrayList<>();
        allProducts.addAll(getRandomProduct(ProductType.KASHA, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.BREAD, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.BUTTER, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.TEA, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.SOFT_DRINK, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.SOUP, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.LUNCH, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.SALAD, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.TEA, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.SNACK, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.DINNER, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.TEA, 1, random));

        if (personCard.getBmi() > 25) {
            bov *= 0.8;
        }
        double bov1 = 0.3 * bov;
        double bov2 = 0.05 * bov;
        double bov3 = 0.35 * bov;
        double bov4 = 0.05 * bov;
        double bov5 = 0.25 * bov;

        productLines.addAll(calcPerTime(bov1, allProducts, 0, 4, personCard));
        productLines.addAll(calcPerTime(bov2, allProducts, 4, 5, personCard));
        productLines.addAll(calcPerTime(bov3, allProducts, 5, 9, personCard));
        productLines.addAll(calcPerTime(bov4, allProducts, 9, 10, personCard));
        productLines.addAll(calcPerTime(bov5, allProducts, 10, 12, personCard));

        return productLines;
    }

    private List<ProductLine> calcPerTime(double bov, List<Product> allProducts, int i1, int i2, PersonCard personCard) {
        List<ProductLine> productLines = new ArrayList<>();
        for (int i = i1; i < i2; i++) {
            productLines.add(new ProductLine(getMinimumByType(allProducts.get(i).getProductType()), allProducts.get(i), personCard));
        }

        double sum = 0;

        for (ProductLine productLine : productLines) {
            sum += (productLine.getQuantity() * productLine.getProduct().getKkal());
        }
        sum *= 0.01;
        while (bov >= sum) {
            for (ProductLine productLine : productLines) {
                if (sum >= bov) break;
                double quantity = productLine.getQuantity();
                double delta = getDeltaByType(productLine.getProduct().getProductType());
                quantity += delta;
                productLine.setQuantity(quantity);
                sum += (0.01 * delta * productLine.getProduct().getKkal());
            }
        }

        return productLines;
    }

   /* private List<ProductLine> generateProductLines(double bov, PersonCard personCard) {
        Random random = new Random();
        List<ProductLine> productLines = new ArrayList<>();
        List<Product> allProducts = new ArrayList<>();
        allProducts.addAll(getRandomProduct(ProductType.MEAT, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.FISH, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.BREAD, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.VEGETABLE, 5, random));
        allProducts.addAll(getRandomProduct(ProductType.FRUIT, 2, random));
        allProducts.addAll(getRandomProduct(ProductType.GROATS, 2, random));
        allProducts.addAll(getRandomProduct(ProductType.LEGUME, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.DRIED_FRUIT, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.DAIRY, 2, random));
        allProducts.addAll(getRandomProduct(ProductType.NUT, 1, random));
        allProducts.addAll(getRandomProduct(ProductType.SOFT_DRINK, 2, random));
        for (Product product : allProducts) {
            productLines.add(new ProductLine(getMinimumByType(product.getProductType()), product, personCard));
        }
        double sum = 0;
        for (ProductLine productLine : productLines) {
            sum += (productLine.getQuantity() * productLine.getProduct().getKkal());
        }
        sum /= 100;
        while (bov > sum) {
            for (ProductLine productLine : productLines) {
                if (sum > bov) break;
                double quantity = productLine.getQuantity();
                quantity += getDeltaByType(productLine.getProduct().getProductType());
                productLine.setQuantity(quantity);
                sum += (0.01 * quantity * productLine.getProduct().getKkal());
            }
        }

        return productLines;
    }*/

    private List<Product> getRandomProduct(ProductType type, int quantity, Random random) {
        List<Product> products = productManager.getProductListByType(type);
        List<Product> productList = new ArrayList<>();
        int i = 0;
        while (i < quantity) {
            int ind = random.nextInt(products.size());
            Product product = products.get(ind);
//            oldingi variantda nomlari xisobga olinmagandi
            if (!productList.contains(product)) {
                productList.add(product);
                i++;
            }

            /*if (!isTheSameOrLikeProduct(productList, product)) {
                productList.add(product);
                i++;
            }*/
        }

        return productList;
    }

    private double getMinimumByType(ProductType type) {
        switch (type) {
            case FISH:
            case MEAT:
                return 70;
            case FRUIT:
                return 100;
            case DAIRY:
                return 40;
            case BREAD:
                return 40;
            case GROATS:
                return 12;
            case LEGUME:
                return 20;
            case DRIED_FRUIT:
                return 15;
            case NUT:
                return 10;
            case VEGETABLE:
                return 150;
            case SOFT_DRINK:
                return 150;
            case KASHA:
                return 80;
            case BUTTER:
                return 10;
            case TEA:
                return 100;
            case SOUP:
                return 100;
            case LUNCH:
                return 50;
            case SALAD:
                return 100;
            case SNACK:
                return 50;
            case DINNER:
                return 100;

        }
        return 0;
    }

    private double getDeltaByType(ProductType type) {
        switch (type) {
            case FISH:
            case MEAT:
                return 1;
            case FRUIT:
                return 1;
            case DAIRY:
                return 0.4;
            case BREAD:
                return 0.2;
            case GROATS:
                return 0.12;
            case LEGUME:
                return 0.2;
            case DRIED_FRUIT:
                return 0.15;
            case NUT:
                return 0.1;
            case VEGETABLE:
                return 1.5;
            case SOFT_DRINK:
                return 0.2;
            case KASHA:
                return 1;
            case BUTTER:
                return 0.1;
            case TEA:
                return 0.3;
            case SOUP:
                return 1;
            case LUNCH:
                return 0.5;
            case SALAD:
                return 1;
            case SNACK:
                return 0.5;
            case DINNER:
                return 1;
        }
        return 0;
    }

    private String getAp(double ap) {
        if (ap < 2.6) {
            return "удовлетворительной адаптации";
        } else if (ap >= 2.6 && ap <= 3.09) {
            return "напряжению механизмов адаптации";
        } else if (ap > 3.09 && ap <= 3.49) {
            return "неудовлетворительной адаптации";
        } else {
            return "срыв адаптации";
        }
    }

    private String getBMI(double bmi) {
        if (bmi >= 19 && bmi <= 25) {
            return "норма";
        } else if (bmi > 25 && bmi <= 29) {
            return "У вас избыточная масса тела";
        } else if (bmi > 29) {
            return "Вы страдаете ожирением";
        }

        return "";
    }

    private double getBOV(PersonCard personCard) {
        double bov;
        if (personCard.getSex() == 1) {
            bov = (66 + 13.7 * personCard.getMassBody() + 5 * personCard.getHeight() - 6.8 * personCard.getAge() * 1.4);
        } else {
            bov = (655 + 9.6 * personCard.getMassBody() + 1.8 * personCard.getHeight() - 4.7 * personCard.getAge() * 1.4);
        }

        return (((double) ((int) (bov * 100))) / 100);
    }


    private String getIFS(PersonCard personCard) {
        double ifs = personCard.getTestPsix().getIfs();
        String ufs = "";
        if (ifs < 0.376) {
            ufs = (personCard.getSex() == 1) ? "низкий" : "ниже среднего";
        } else if (ifs >= 0.376 && ifs <= 0.525) {
            ufs = (personCard.getSex() == 1) ? "ниже среднего" : "средний";
        } else if (ifs >= 0.526 && ifs <= 0.675) {
            ufs = (personCard.getSex() == 1) ? "средний" : "выше среднего";
        } else if (ifs >= 0.676 && ifs <= 0.825) {
            ufs = (personCard.getSex() == 1) ? "выше среднего" : "высокий";
        } else if (ifs > 0.825) {
            ufs = (personCard.getSex() == 1) ? "высокий" : "";
        }
        return ufs;
    }

    private String getStress(PersonCard personCard) {
        double res = 4 - personCard.getTestPsix().getAverg();
        String urovenStress = "";
        if (personCard.getSex() == 1) {
            if (res >= 2 && res <= 3) {
                urovenStress = "Высокий";
            } else if (res >= 1 && res < 2) {
                urovenStress = "Средний";
            } else {
                urovenStress = "Низкий";
            }
        } else {
            if (res >= 2.18 && res <= 3) {
                urovenStress = "Высокий";
            } else if (res >= 1.18 && res < 2.18) {
                urovenStress = "Средний";
            } else {
                urovenStress = "Низкий";
            }
        }
        return urovenStress;
    }

    private double getStressValue(PersonCard personCard) {
        double value = 4 - personCard.getTestPsix().getAverg();
        return (((double) ((int) (value * 100))) / 100);
    }

    private boolean isCardiolog(PersonCard personCard) {
        int i = 0;
        if (personCard.getTestTexas().getAnswer1() == 4) {
            return true;
        }
        if (personCard.getTestTable().getTest3() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest21() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest22() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest24() == 1) {
            i++;
        }

        return (i >= 2);
    }

    private boolean isNevropotolog(PersonCard personCard) {
        int i = 0;
        if (personCard.getTestTable().getTest1() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest2() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest5() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest11() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest15() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest16() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest17() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest18() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest20() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest25() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest28() == 1) {
            i++;
        }

        return (i >= 2);
    }

    private boolean isGastro(PersonCard personCard) {
        int i = 0;
        if (personCard.getTestTable().getTest12() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest14() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest23() == 1) {
            i++;
        }
        if (personCard.getTestTable().getTest27() == 1) {
            i++;
        }

        return (i >= 2);
    }

    private boolean isTheSameOrLikeProduct(List<Product> productList, Product product) {
        String subName = product.getName().substring(0, 2);
        for (Product prod : productList) {
            if (prod.getName().substring(0, 2).equalsIgnoreCase(subName)) {
                return true;
            }
        }
        return false;
    }


}
