package by.epam.tutorial.service;

import by.epam.tutorial.model.entities.Item;
import by.epam.tutorial.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemRepository itemRepository;

    public List<Item> getItems() {
        return itemRepository.findAll(new PageRequest(0, 20, Sort.Direction.DESC, "publishedDate")).getContent();
    }
}
