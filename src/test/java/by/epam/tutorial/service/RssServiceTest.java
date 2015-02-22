package by.epam.tutorial.service;

import by.epam.tutorial.exception.RssException;
import by.epam.tutorial.model.entities.Item;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import static org.junit.Assert.*;

public class RssServiceTest {

    private RssService rssService;

    @Before
    public void setUp() throws Exception {
        rssService = new RssService();
    }

    @Test
    public void testGetItemsSizeFile() throws RssException {
        List<Item> items = rssService.getItems(new File("test-rss/javavids.xml"));
        assertEquals(10, items.size());

    }

    @Test
    public void testGetItemsFirstItemFile() throws RssException {
        List<Item> items = rssService.getItems(new File("test-rss/javavids.xml"));
        Item item = items.get(0);
        assertEquals("How to solve Source not found error during debug in Eclipse", item.getTitle());
    }

    @Test
    public void testGetItemsPubDateFile() throws RssException {
        List<Item> items = rssService.getItems(new File("test-rss/javavids.xml"));
        Item item = items.get(0);
        assertEquals("22 06 2014 23:35:49",
                new SimpleDateFormat("dd MM yyyy HH:mm:ss", Locale.ENGLISH).format(item.getPublishedDate()));
    }

}